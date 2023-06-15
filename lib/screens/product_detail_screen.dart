import 'package:flutter/material.dart';
import 'package:projecthomepage/screens/cart_screen.dart';
import 'package:get/get.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.image, required this.name,required this.price})
      : super(key: key);

  final String image, name, price;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int itemQuantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.3,
        title: const Text(
          "Product detail",
          style: TextStyle(fontSize: 20, color: Colors.black),
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    color: Colors.black12,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: List.generate(
                          5,
                          (index) => Icon(
                                Icons.star,
                                color:
                                    index == 4 ? Colors.white70 : Colors.yellow,
                                size: 25,
                              )),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   widget.name,
                                   style: const TextStyle(
                                       fontSize: 22, fontWeight: FontWeight.bold),
                                 ),
                                 const SizedBox(
                                   height: 5,
                                 ),
                                 const Row(
                                   children: [
                                     Text(
                                       "2.8 km away",
                                       style: TextStyle(
                                         fontSize: 14,
                                       ),
                                     ),
                                     SizedBox(
                                       width: 5,
                                     ),
                                     Icon(
                                       Icons.location_on_outlined,
                                       size: 18,
                                     ),
                                   ],
                                 )
                               ],
                             ),
                              Column(
                               crossAxisAlignment: CrossAxisAlignment.end,
                               children: [
                                 Text(
                                   'Rs:/- ${widget.price}',
                                   style: TextStyle(
                                     fontSize: 22,
                                     fontWeight: FontWeight.bold,
                                     color: Color(0xFFEA7049),
                                   ),
                                 ),
                                 SizedBox(
                                   height: 5,
                                 ),
                                 Row(
                                   children: [
                                     Text(
                                       "free shipping",
                                       style: TextStyle(
                                         fontSize: 14,
                                         color: Color(0xFFEA7049),
                                       ),
                                     ),
                                   ],
                                 )
                               ],
                             )
                           ],
                         ),
                       ),
                       const SizedBox(height: 20,),
                       const Padding(
                         padding: EdgeInsets.symmetric(horizontal: 20),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               "Details",
                               style: TextStyle(
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black,
                               ),
                             ),
                             SizedBox(
                               height: 5,
                             ),
                             Text(
                               "A burger is a patty of ground beef grilled and placed"
                                   "between two halves of a bun. Slices of raw onion, lettuce, bacon,"
                                   "mayonnaise, and other ingredients add flavor. Burgers are considered"
                                   "an American food but are popular around the world. In Japan,"
                                   "teriyaki burgers are popular."
                                   "A burger is a patty of ground beef grilled and placed"
                                   "between two halves of a bun. Slices of raw onion, lettuce, bacon,"
                                   "mayonnaise, and other ingredients add flavor. Burgers are considered"
                                   "an American food but are popular around the world. In Japan,"
                                   "teriyaki burgers are popular."
                                   "A burger is a patty of ground beef grilled and placed"
                                   "between two halves of a bun. Slices of raw onion, lettuce, bacon,"
                                   "mayonnaise, and other ingredients add flavor. Burgers are considered"
                                   "an American food but are popular around the world. In Japan,"
                                   "teriyaki burgers are popular.",
                               maxLines: 5,
                               overflow: TextOverflow.ellipsis,
                               style: TextStyle(fontSize: 16, color: Colors.black38),
                               textAlign: TextAlign.justify,
                             )
                           ],
                         ),
                       ),
                     ],
                   ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFFEA7049),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(onPressed: (){
                                  setState(() {
                                    if (itemQuantity == 0 ){
                                    } else
                                      {
                                        itemQuantity--;
                                      }
                                  });
                                }, icon: const Icon(
                                  Icons.remove, color: Color(0xFFEA7049),
                                )),
                                Text(itemQuantity.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFEA7049),),),
                                IconButton(onPressed: (){
                                  setState(() {
                                    itemQuantity++;
                                  });
                                }, icon: const Icon(
                                  Icons.add, color: Color(0xFFEA7049),
                                )),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added to Cart"),
                                    duration: Duration(milliseconds: 500),
                                        backgroundColor: Colors.black87, elevation: 0,));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: const Color(0xFFEA7049),
                                        )),
                                    child: const Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xFFEA7049),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    dynamic product = {
                                      "name":widget.name,
                                      "price":widget.price,
                                      "image":widget.image
                                    };

                                    Get.to(CartScreen(product:product,quantity:itemQuantity), transition: Transition.leftToRightWithFade,
                                        duration: const Duration(milliseconds: 400));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xFFEA7049),
                                    ),
                                    child: const Text(
                                      "Place Order",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
