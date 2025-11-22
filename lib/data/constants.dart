//Style immer einheitlich auf allen Seiten, vereinfacht die Wiederverwensbarkeit
import 'package:flutter/material.dart';

class KTextStyle {
  static const TextStyle titleText = TextStyle(
    //Für Überschriften
    color: Colors.teal,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    //letterSpacing: 10.0,
  );
  static const TextStyle descriptionText = TextStyle(
    // Für normelen Text
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
  );
}
