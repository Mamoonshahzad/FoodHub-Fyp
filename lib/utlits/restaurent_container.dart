import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
  super.key,
  required this.image,
  required this.isActive,
  required this.name,
  });
  final String image, name;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 7),
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      decoration: BoxDecoration(
          color: isActive ? const Color(0xFFEA7049) : const Color(0XFFF5F5F5),
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30), bottom: Radius.circular(30)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 1),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(image),
          ),
          Text(
            name,
            style: TextStyle(
                color: isActive ? Colors.white : Colors.black26, fontSize: 12),
          ),
        ],
      ),
    );
  }
}