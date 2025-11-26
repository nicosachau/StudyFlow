import 'package:flutter/material.dart';
import 'package:studyflow/data/notifieres.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studyflow/views/widget_tree.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          home: const WidgetTree(), //legt den Screen beim Öffnen fest
        );
      },
    );
  }
}
