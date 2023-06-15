import 'package:flutter/cupertino.dart';

class Restaurant {
  final String image, name;
  final List<Menu> menuList;
  Restaurant({required this.image, required this.name, required this.menuList,});
}

List<Restaurant> restaurants = [
  Restaurant(image: "assets/images/rest.png", name: "KFC", menuList: kfcMenuList),
  Restaurant(image: "assets/images/thr.png", name: "THR", menuList: thrMenuList),
  Restaurant(image: "assets/images/rest.png", name: "KFC", menuList: kfcMenuList),
  Restaurant(image: "assets/images/thr.png", name: "THR", menuList: thrMenuList),
  Restaurant(image: "assets/images/thr.png", name: "THR", menuList: thrMenuList),
];


class Menu {
  final String itemName, itemImage;
  Menu({required this.itemName, required this.itemImage});
}

List<Menu> kfcMenuList = [
  Menu(itemName: "KFC Chicken", itemImage: "assets/images/karhai.png",),
  Menu(itemName: "KFC Burger", itemImage: "assets/images/burger.png",),
  Menu(itemName: "KFC Chicken", itemImage: "assets/images/karhai.png",),
  Menu(itemName: "KFC Burger", itemImage: "assets/images/burger.png",),
  Menu(itemName: "KFC Chicken", itemImage: "assets/images/karhai.png",),
  Menu(itemName: "KFC Chicken", itemImage: "assets/images/karhai.png",),
  Menu(itemName: "KFC Chicken", itemImage: "assets/images/karhai.png",),
  Menu(itemName: "KFC Chicken", itemImage: "assets/images/karhai.png",),
  Menu(itemName: "KFC Chicken", itemImage: "assets/images/karhai.png",),
];

List<Menu> thrMenuList = [
  Menu(itemName: "THR Burger", itemImage: "assets/images/burger.png",),
  Menu(itemName: "THR Chicken", itemImage: "assets/images/karhai.png",),
  Menu(itemName: "THR Burger", itemImage: "assets/images/burger.png",),
  Menu(itemName: "THR Chicken", itemImage: "assets/images/karhai.png",),
  Menu(itemName: "THR Burger", itemImage: "assets/images/burger.png",),
  Menu(itemName: "THR Burger", itemImage: "assets/images/burger.png",),
  Menu(itemName: "THR Burger", itemImage: "assets/images/burger.png",),
  Menu(itemName: "THR Burger", itemImage: "assets/images/burger.png",),
  Menu(itemName: "THR Burger", itemImage: "assets/images/burger.png",),
];



