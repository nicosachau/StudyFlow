import 'package:flutter/material.dart';
import 'package:mob_app/views/pages/login_page.dart';
import 'package:mob_app/views/widgets/hero_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeroWidget(
                  title: '',
                ), //dadruch entsteht eine kleine Animation beim öffnen
                SizedBox(height: 10), //schafft etwas platz, wie padding oder so
                FittedBox(
                  // dadurch bleibt der Text immer auf der Seite und verurscht keinen Fehler
                  child: Text(
                    'StudyFlow',
                    style: TextStyle(
                      //color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      letterSpacing: 50,
                    ),
                  ),
                ),
                SizedBox(height: 20), //schafft etwas platz, wie padding oder so
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      //Navigiert zur Startseite nach Login
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: 'Register');
                        },
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text('Get Started'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      //Navigiert zur Startseite nach Login
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: 'Login');
                        },
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
