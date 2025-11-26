import 'package:flutter/material.dart';
import 'package:studyflow/data/constants.dart';

class ModulePage extends StatelessWidget {
  const ModulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          buildModuleCard(),
          buildModuleCard(),
          buildModuleCard(),
          buildModuleCard(),
        ],
      ),
    );
  }

  // Wiederverwendbares Widget
  Widget buildModuleCard() {
    return Container(
      width: double.infinity, //auf Bildschirmbreite
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('MOB', style: KTextStyle.titleText),
              Text('Mobile Systeme', style: KTextStyle.descriptionText),
              Text('4 SWS', style: KTextStyle.descriptionText),
              Text('5,0 Leistungspunkte', style: KTextStyle.descriptionText),
              Text(
                'Präsenzzeit: 48 Stunden',
                style: KTextStyle.descriptionText,
              ),
              Text(
                'Selbststudium: 102 Stunden',
                style: KTextStyle.descriptionText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
