
import 'package:flutter/material.dart';
import 'package:projecthomepage/screens/payment_details_screen.dart';
import 'package:get/get.dart';

class Address extends StatefulWidget {
   Address({Key? key,required this.price}) : super(key: key);
   int price;
  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.3,
        title: const Text(
          "Address",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.60,
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(
                          child: CustomTextFieldAddress(
                            label: 'First Name',
                            hintText: 'Arsalan',
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: CustomTextFieldAddress(
                            label: 'Last Name',
                            hintText: 'Khan',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const CustomTextFieldAddress(
                      label: 'Address',
                      hintText: 'Kust Kohat',
                    ),
                    const SizedBox(height: 20,),
                    const CustomTextFieldAddress(
                      label: 'phone Number',
                      hintText: '0330',
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: const [
                        Expanded(
                          child: CustomTextFieldAddress(
                            label: 'City',
                            hintText: 'Kohat',
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: CustomTextFieldAddress(
                            label: 'State',
                            hintText: 'KpK',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Text(
                                  "Order Total",
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Rs. ${widget.price.toString()}',
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Delivery charges",
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Free",
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Text(
                                  "Total Price",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${widget.price.toString()}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to( PaymentDetail(price:widget.price),
                              transition: Transition.leftToRightWithFade,
                              duration: const Duration(milliseconds: 400));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
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
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldAddress extends StatelessWidget {
  final String label, hintText;

  const CustomTextFieldAddress({
  super.key,
  required this.label,
  required this.hintText,

  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.pink.shade400,
        ),
        contentPadding: const EdgeInsets.only(left: 20, bottom: 2,right: 2,top: 2),
        filled: true,
        fillColor: Colors.black.withOpacity(0.03),
        labelText: label,
        hintText: hintText,
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
      cursorColor: Colors.black,
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }
}