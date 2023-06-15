
import 'package:flutter/material.dart';
import 'package:projecthomepage/screens/profile_screen.dart';

import 'home_screen.dart';

class TabsScreen extends StatefulWidget {
  final int currentPageIndex;
  const TabsScreen({Key? key, this.currentPageIndex = 0}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late int _selectedIndex;
  @override
  void initState() {
    _selectedIndex = widget.currentPageIndex;
    super.initState();
  }
  final List<Widget> _pages = [
    const HomeScreen(),
     ProfilePage(),
  ];
  List<BottomNavigationBarItem> getTabsData(){
    return [
      const BottomNavigationBarItem(
        activeIcon: Icon(Icons.home_filled),
          icon:  Icon(
              Icons.home_outlined
          ),
          label: 'Home'
      ),
      /*const BottomNavigationBarItem(
          activeIcon:  Icon(
            Icons.favorite_rounded,
          ),
          icon: Icon(Icons.favorite_border_rounded),
          label: 'Favorites'
      ),
      const BottomNavigationBarItem(
        activeIcon: Icon(Icons.shopping_cart_rounded),
          icon:  Icon(
            Icons.shopping_cart_outlined,
          ),
          label: 'Cart'
      ),
      const BottomNavigationBarItem(
        activeIcon: Icon(Icons.message_rounded),
          icon:  Icon(
            Icons.message_outlined,
          ),
          label: 'Chats'
      ),*/
      const BottomNavigationBarItem(
        activeIcon: Icon(Icons.person_rounded),
          icon:  Icon(
            Icons.person_outline_rounded,
          ),
          label: 'Profile'
      ),
    ];
  }

  void _selectPage(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: _pages[_selectedIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(4, 0),
                  blurRadius: 14,
                  color: const Color(0xFFFF8DDB).withOpacity(0.54),
                ),
              ],),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.orange,
                unselectedItemColor:  Colors.black,
                showSelectedLabels: false,
                onTap: _selectPage,
                items: getTabsData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
