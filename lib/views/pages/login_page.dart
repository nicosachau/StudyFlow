import 'package:flutter/material.dart';
import 'package:mob_app/views/widget_tree.dart';
import 'package:mob_app/views/widgets/hero_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title; //um die Daten beim registrieren in Login abzurufen

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController(text: '123');
  TextEditingController controllerPasswort = TextEditingController(text: '456');
  String confirmedEmail = '123';
  String confirmedPasswort = '456';

  @override //wird ausgelöst wenn die Seite aufgerufen wird
  void initState() {
    print('Login Seite aufgerufen');
    super.initState();
  }

  /*
  1. initState ausgeführt
  2. build Widget wird ausfeührt (Seite aufgebaut)
  3. wenn setState, wird initState nicht immer wieder ausgeführt, sondern nur build
  */

  @override //Entsorgt die Information (hier controller), wenn man die (Login-) Seite nicht mehr braucht
  void dispose() {
    controllerEmail.dispose();
    controllerPasswort.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeroWidget(title: widget.title),
                SizedBox(height: 20.0),
                TextField(
                  controller: controllerEmail, // zum Text darstellen
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onEditingComplete: () =>
                      setState(() {}), // Arrow kann nur einen Befehl haben
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: controllerPasswort, // zum Text darstellen
                  decoration: InputDecoration(
                    hintText: 'Passwort',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onEditingComplete: () =>
                      setState(() {}), // Arrow kann nur einen Befehl haben
                ),
                SizedBox(height: 20), //schafft etwas platz, wie padding oder so
                ElevatedButton(
                  onPressed: () {
                    onLoginPressed();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text(widget.title),
                ),
                SizedBox(height: 80.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onLoginPressed() {
    //außerhalb von biuld
    if (confirmedEmail == controllerEmail.text &&
        confirmedPasswort == controllerPasswort.text) {
      Navigator.pushReplacement(
        //Navigiert zur Startseite nach Login
        context,
        MaterialPageRoute(
          builder: (context) {
            return WidgetTree();
          },
        ),
      );
    }
  }
}
