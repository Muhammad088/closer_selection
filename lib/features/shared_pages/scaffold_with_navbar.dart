import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          ...navigationShell.route.branches.map(
            (e) => BottomNavigationBarItem(
              icon: Icon(
                e.defaultRoute!.path == '/home'
                    ? Icons.home
                    : e.defaultRoute!.path == '/application'
                        ? Icons.work
                        : Icons.settings,
                size: 20,
              ),
              activeIcon: Icon(
                e.defaultRoute!.path == '/home'
                    ? Icons.home
                    : e.defaultRoute!.path == '/application'
                        ? Icons.work
                        : Icons.settings,
                size: 30,
                color: Colors.amber,
              ),
              label: e.defaultRoute!.name,
            ),
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
