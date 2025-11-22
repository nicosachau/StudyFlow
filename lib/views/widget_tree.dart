import 'package:flutter/material.dart';
import 'package:mob_app/data/notifieres.dart';
import 'package:mob_app/views/pages/module_page.dart';
import 'package:mob_app/views/pages/pomodore_page.dart';
import 'package:mob_app/views/pages/settings_page.dart';

import 'pages/menu_page.dart';
import 'widgets/navbar_widget.dart';

List<Widget> pages = [MenuPage(), ModulePage(), PomodorePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StudyFlow'),
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                return Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                ); //! Stellt den Darkmode an
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title:'Settingsssss'); //! führt zu den Einstellungen // Titel wird von hier an die Settings Seite geschickt
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('add button pressed'); // Arguemt hier rein
        },
        child: Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, slectedPage, child) {
          return pages.elementAt(slectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
