import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app_routes/paths.dart';

class FarmingNavBar extends StatefulWidget {
  final Widget child; // must match what ShellRoute passes
  const FarmingNavBar({super.key, required this.child});

  @override
  State<FarmingNavBar> createState() => _FarmingNavBarState();
}

class _FarmingNavBarState extends State<FarmingNavBar> {
  int _currentIndex = 0;

  final List<String> _routes = [
    RoutePaths.home,
    RoutePaths.product,
    RoutePaths.order,
    RoutePaths.profile,
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
      GoRouter.of(context).go(_routes[index]); // navigate to tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child, // current screen from ShellRoute
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Product",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "Orders",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
