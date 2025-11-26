import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studyflow/views/widget_tree.dart';
import 'package:studyflow/views/widgets/hero_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // FirebaseAuth Instanz erstellen
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Controller für die Eingabefelder
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPasswort = TextEditingController();

  // Zustand für die Ladeanzeige und Fehlermeldungen
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPasswort.dispose();
    super.dispose();
  }

  // Asynchrone Methode für den Registrierungs-Vorgang
  Future<void> _onRegisterPressed() async {
    if (_controllerEmail.text.isEmpty || _controllerPasswort.text.isEmpty) {
      setState(() {
        _errorMessage = "Bitte fülle beide Felder aus.";
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Neuen Benutzer mit Firebase-Authentifizierung erstellen
      await _auth.createUserWithEmailAndPassword(
        email: _controllerEmail.text.trim(),
        password: _controllerPasswort.text.trim(),
      );

      // Bei Erfolg direkt zur App weiterleiten (WidgetTree prüft den Auth-Status)
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const WidgetTree()),
              (route) => false, // Entfernt alle vorherigen Routen
        );
      }
    } on FirebaseAuthException catch (e) {
      // Fehlerbehandlung
      setState(() {
        if (e.code == 'weak-password') {
          _errorMessage = 'Das Passwort ist zu schwach.';
        } else if (e.code == 'email-already-in-use') {
          _errorMessage = 'Diese E-Mail-Adresse wird bereits verwendet.';
        } else if (e.code == 'invalid-email') {
          _errorMessage = 'Das Format der E-Mail-Adresse ist ungültig.';
        } else {
          _errorMessage = 'Ein unbekannter Fehler ist aufgetreten.';
        }

      });
    } finally {
      // Ladezustand beenden, egal ob erfolgreich oder nicht
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeroWidget(title: "Account erstellen"),
                const SizedBox(height: 20.0),

                // Fehlermeldung anzeigen, falls vorhanden
                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),

                TextField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _controllerPasswort,
                  decoration: InputDecoration(
                    hintText: 'Passwort',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  obscureText: true, // Passwort verbergen
                ),
                const SizedBox(height: 20),

                // Ladeanzeige oder Button anzeigen
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: _onRegisterPressed,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40.0),
                  ),
                  child: const Text("Registrieren"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
