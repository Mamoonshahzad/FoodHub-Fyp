import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utlits/data_class.dart';
import '../utlits/item_container.dart';
import 'product_detail_screen.dart';

class FoodItemPage extends StatefulWidget {
  const FoodItemPage(
      {Key? key,
      required this.fooditems,
      required this.title,
      required this.currentIndex})
      : super(key: key);
  final List<dynamic> fooditems;
  final String title;
  final int currentIndex;

  @override
  State<FoodItemPage> createState() => _FoodItemPageState();
}

class _FoodItemPageState extends State<FoodItemPage> {
  @override
  Widget build(BuildContext context) {
    Future<List> fetchFoodItems() async {
      List foodItems = [];
      List<String> foodItemIds = List<String>.from(widget.fooditems);
      for (var i = 0; i < foodItemIds.length; i++) {
        if (foodItemIds[i].runtimeType == String) {
          print(" string");
        }
        String documentId = foodItemIds[i];
        final DocumentSnapshot<Map<String, dynamic>> snapshot =
            await FirebaseFirestore.instance
                .collection('food-items')
                .doc(documentId.toString())
                .get();

        if (snapshot.exists) {
          final Map<String, dynamic>? data = snapshot.data();
          if (data != null) {
            debugPrint(data.toString());
            final String name = data['name'];
            final String image = data['image'];
            final String price = data['price'];
            dynamic foodItem = {'name': name, 'price': price, 'image': image};
            debugPrint(data.toString());
            foodItems.add(foodItem);
          }
        }
      }
      debugPrint(foodItems.toString());
      return foodItems;
    }

    debugShowCheckedModeBanner:
    false;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.3,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              color: Colors.black,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(2),
                filled: true,
                fillColor: Colors.black.withOpacity(0.03),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black12,
                ),
                hintText: "Search Product",
                hintStyle: const TextStyle(color: Colors.black12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
              cursorColor: Colors.black38,
              style: const TextStyle(color: Colors.black38),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: FutureBuilder<List>(
                  future: fetchFoodItems(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(
                          child: Text('Error occurred: ${snapshot.error}'));
                    }

                    final List foodItems = snapshot.data!;

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.7,
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: foodItems.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.to(
                              ProductDetail(
                                  image: foodItems[index]['image'],
                                  name: foodItems[index]['name'],
                                  price: foodItems[index]['price']
                              ),
                              transition: Transition.leftToRightWithFade,
                              duration: const Duration(milliseconds: 400));
                        },
                        child: ItemContainer(
                            image: foodItems[index]['image'],
                            name: foodItems[index]['name'],
                            price: foodItems[index]['price'],
                            restImage: widget.currentIndex == 0
                                ? "assets/images/rest.png"
                                : "assets/images/thr.png"),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
