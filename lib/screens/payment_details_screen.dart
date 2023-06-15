import 'package:flutter/material.dart';
import 'package:projecthomepage/screens/verify_address.dart';
import 'package:get/get.dart';

class PaymentDetail extends StatefulWidget {
  PaymentDetail({Key? key,required this.price}) : super(key: key);
  int price;
  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
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
          "Check out",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.20,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/visa.png"
                    ),
                    fit: BoxFit.contain
                  )
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.40,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(
                      label: 'Name',
                      hintText: 'Write your name on card',
                    ),
                    CustomTextField(
                      label: 'Account Number',
                      hintText: 'Write your account number',
                    ),
                    CustomTextField(
                      label: 'Expiration Date',
                      hintText: '10/March/2024',
                    ),
                    CustomTextField(
                      label: 'CVV',
                      hintText: 'Peshawar',
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order Total",
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Rs. ${widget.price}',
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                            children: [
                              Text(
                                "Total Price",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${widget.price}',
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
                        Get.to( VerifyAddress(price:widget.price),
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
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label, hintText;

  const CustomTextField({
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
