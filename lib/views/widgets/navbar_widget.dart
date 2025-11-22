import 'package:flutter/material.dart';
import 'package:mob_app/data/notifieres.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.menu), label: 'Menü'),
            NavigationDestination(icon: Icon(Icons.home), label: 'Module'),
            NavigationDestination(icon: Icon(Icons.alarm), label: 'Pomodore'),
          ],
          onDestinationSelected: (int value) {
            print(value);
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
