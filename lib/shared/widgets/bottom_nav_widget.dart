import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final Widget child;

  const BottomNavBar({super.key, required this.child});

  static final _tabs = [
    _TabItem(
      route: '/',
      icon: Icons.person_add,
      label: 'Nuevo',
    ),
    _TabItem(
      route: '/list',
      icon: Icons.people,
      label: 'Usuarios',
    ),
  ];

  int _locationToIndex(String location) {
    return _tabs.indexWhere((tab) => location == tab.route).clamp(0, _tabs.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    final int selectedIndex = _locationToIndex(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => context.go(_tabs[index].route),
        destinations: _tabs
            .map((tab) => NavigationDestination(
          icon: Icon(tab.icon),
          label: tab.label,
        ))
            .toList(),
      ),
    );
  }
}

class _TabItem {
  final String route;
  final IconData icon;
  final String label;

  const _TabItem({
    required this.route,
    required this.icon,
    required this.label,
  });
}
