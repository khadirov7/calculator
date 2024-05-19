
import 'package:calculator/screens/tabs/products/products_screen.dart';
import 'package:calculator/screens/tabs/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/tab_view_model.dart';
import 'category/category_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> screens = [
    CategoriesScreen(),
    ProductsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[context.watch<TabViewModel>().getIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<TabViewModel>().getIndex,
        onTap: (newIndex) {
          context.read<TabViewModel>().changeIndex(newIndex);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
            activeIcon: Icon(
              Icons.category,
              color: Colors.green,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: "Products",
            activeIcon: Icon(
              Icons.check_box_outline_blank,
              color: Colors.green,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            activeIcon: Icon(
              Icons.person,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
