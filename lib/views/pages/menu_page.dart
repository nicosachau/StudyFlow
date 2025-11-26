import 'package:flutter/material.dart';
import 'package:studyflow/views/widgets/hero_widget.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsGeometry.all(20.0),
        child: Column(children: [HeroWidget(title: 'StudyFlow')]),
      ),
    );
  }
}
