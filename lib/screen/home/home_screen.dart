import 'package:esign/constants/colors.dart';
import 'package:esign/screen/ar/ar_screen.dart';
import 'package:esign/screen/esign/esign_screen.dart';
import 'package:esign/screen/home/home_screen_page.dart';
import 'package:esign/screen/search/search_screen.dart';
import 'package:esign/screen/shop/shop_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pageList = [
    const HomePage(),
    const EsignPage(),
    const ArShowPage(),
    const ShopPage(),
    const SearchPage(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        fixedColor: purple,
        iconSize: 24,
        onTap: _onItemTapped,
        unselectedItemColor: black,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'خانه',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_color_outlined),
            label: 'ایزاین',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'AR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'فروشگاه',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'جستجو',
          ),
        ],
      ),
      body: pageList.elementAt(_selectedIndex),
    );
  }
}
