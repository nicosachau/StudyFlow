import 'package:flutter/material.dart';
import 'package:mob_app/data/notifieres.dart';
import 'package:mob_app/views/pages/welcome_page.dart';

void main() {
  runApp(const StudyFlow());
}

class StudyFlow extends StatefulWidget {
  const StudyFlow({super.key});

  @override
  State<StudyFlow> createState() => _MyAppState();
}

class _MyAppState extends State<StudyFlow> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: WelcomePage(), //legt den Screen beim öffnen fest
        );
      },
    );
  }
}
