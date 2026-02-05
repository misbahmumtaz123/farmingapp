import 'package:flutter/material.dart';

import '../Views/dashboard/home_screen.dart';
import '../Views/dashboard/mycrop_screen.dart';
import '../Views/dashboard/order_screen.dart';
import '../Views/dashboard/profile_screen.dart';

class FarmingNavBar extends StatefulWidget {
  const FarmingNavBar({super.key});

  @override
  State<FarmingNavBar> createState() => _FarmingNavBarState();
}

class _FarmingNavBarState extends State<FarmingNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    ProductsScreen(),
    OrdersScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Product"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
