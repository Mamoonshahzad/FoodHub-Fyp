import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projecthomepage/firebase/restaurant_database.dart';
import 'package:projecthomepage/screens/login_page.dart';
import 'package:projecthomepage/screens/product_detail_screen.dart';
import 'package:projecthomepage/screens/profile_screen.dart';
import 'package:projecthomepage/utlits/data_class.dart';
import 'package:projecthomepage/utlits/item_container.dart';
import 'package:get/get.dart';
import 'package:projecthomepage/utlits/routes.dart';

import '../utlits/data_class.dart';
import '../utlits/restaurent_container.dart';
import 'drawerScreens/contact_us.dart';
import 'drawerScreens/freq_asq_quest.dart';
import 'food_items_screen.dart';

class Restaurant {
  final String name;
  final String image;

  Restaurant({required this.name, required this.image});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final _controller = PageController(
    viewportFraction: 0.8,
  );
  List allRestaurants = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var pageViewList = [
    "assets/images/burger.png",
    "assets/images/karhai.png",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchFoodItems();
  }

  Future<List> fetchFoodItems() async {
    List foodItems = [];
    debugPrint(allRestaurants[currentIndex]['fooditems'].toString());
    List<String> foodItemIds = List<String>.from(allRestaurants[currentIndex]['fooditems']);
    for (var i=0;i<foodItemIds.length; i++) {
      if(foodItemIds[i].runtimeType == String){
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
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
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Container(
        width: 250,
        child: Drawer(
          backgroundColor: Colors.cyanAccent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //       fit: BoxFit.cover,
                //       image: AssetImage("assets/images/background.jpg"))
                // ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black12),
                accountName: Text(
                  "Mamoon Shahzad",
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  "mamoonsherani@gmail.com",
                  style: TextStyle(color: Colors.black),
                ),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                      child: Image(
                    image: AssetImage(
                      'assets/images/thr.png',
                    ),
                  )),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text("Cart"),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text("Favourite"),
              ),
              Divider(
                color: Colors.red,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => freq_ask_quest()));
                },
                leading: Icon(Icons.message_outlined),
                title: Text("FAQs"),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactUs()));
                },
                leading: Icon(Icons.quick_contacts_mail),
                title: Text("Contact Us"),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Log Out"),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();

                  Navigator.pushNamed(context, Routes.loginRoute);
                },
              ),
            ],
          ),
        ),
      ),

      // AppBar(
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   elevation: 0.3,
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.menu,
      //
      //     ),
      //     color: Colors.black,
      //     onPressed: () {
      //
      //     },
      //   ),
      //   title: const Text(
      //     "HOME",
      //     style: TextStyle(fontSize: 20, color: Colors.black),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 5),
      //       child: IconButton(
      //         icon: const Icon(
      //           Icons.shopping_cart,
      //         ),
      //         color: Colors.black,
      //         onPressed: () {},
      //       ),
      //     ),
      //   ],
      // ),

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                padEnds: false,
                controller: _controller,
                itemCount: pageViewList.length,
                itemBuilder: (context, index) => Container(
                  margin: index == 0
                      ? const EdgeInsets.fromLTRB(20, 20, 5, 10)
                      : const EdgeInsets.fromLTRB(5, 20, 20, 10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(pageViewList[index]),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3,
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(3),
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
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Restaurant",
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('restaurants')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading.....");
                  }

                  if (snapshot.hasError) {
                    return Text('Failed to load data...');
                  }

                  final List<QueryDocumentSnapshot<Map<String, dynamic>>>
                      documents = snapshot.data!.docs;

                  allRestaurants = documents;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      documents.length,
                      (index) => GestureDetector(
                        onTap: () {
                          // Handle onTap logic here
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: RestaurantCard(
                          image: documents[index].get('image'),
                          name: documents[index].get('name'),
                          isActive: currentIndex ==index?true:false,
                        ),
                  )
                    ));
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Most Popular",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        debugPrint("clicked");
                        Get.to(
                            FoodItemPage(
                                currentIndex: currentIndex,
                              title: allRestaurants[currentIndex]['name'],
                              fooditems: allRestaurants[currentIndex]['fooditems'],
                            ),
                            transition: Transition.leftToRightWithFade,
                            duration: const Duration(milliseconds: 400));
                      },
                      child: const Text(
                        "View All",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFEA7049),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
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

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: foodItems.length,
                      itemBuilder: (context, index) => Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(left: 20, right: 20)
                            : const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                                ProductDetail(
                                  image: foodItems[index]['image'],
                                  name: foodItems[index]['name'],
                                  price: foodItems[index]['price'],
                                ),
                                transition: Transition.leftToRightWithFade,
                                duration: const Duration(milliseconds: 400));
                          },
                          child: ItemContainer(
                            image: foodItems[index]['image'],
                            name: foodItems[index]['name'],
                            price: foodItems[index]['price'],
                            restImage: 'sd',
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFEA7049),
        unselectedItemColor: Colors.black12,
        backgroundColor: Colors.white,
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined), label: "location"),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.account_circle_rounded,
              ), label: "profile",


          ),
        ],
      ),*/
    );
  }
}
