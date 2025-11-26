import 'package:flutter/material.dart';
import 'package:studyflow/data/notifieres.dart';
import 'package:studyflow/views/pages/module_page.dart';
import 'package:studyflow/views/pages/pomodore_page.dart';
import 'package:studyflow/views/pages/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Für Logout-Button
import 'package:studyflow/views/widget_tree.dart'; // Für Navigation nach Logout
import 'menu_page.dart';
import '../widgets/navbar_widget.dart';

List<Widget> pages = [MenuPage(), ModulePage(), PomodorePage()];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                );
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: 'Settings');
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
          // NEU: Logout-Button
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // Zurück zum WidgetTree, der dann die LoginPage anzeigt
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const WidgetTree()),
                    (route) => false,
              );
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('add button pressed');
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
