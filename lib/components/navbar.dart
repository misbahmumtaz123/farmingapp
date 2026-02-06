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
      backgroundColor: Colors.grey.shade100,

      body: IndexedStack(index: _currentIndex, children: _pages),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navItem(0, Icons.home, "Home"),
            navItem(1, Icons.shopping_bag, "Products"),
            navItem(2, Icons.grid_view, "Orders"),
            navItem(3, Icons.person, "Profile"),
          ],
        ),
      ),
    );
  }

  Widget navItem(int index, IconData icon, String title) {
    bool selected = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => _currentIndex = index);
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Color(0xFF245C32) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          children: [
            Icon(icon, color: selected ? Colors.white : Colors.grey),

            if (selected) ...[
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
