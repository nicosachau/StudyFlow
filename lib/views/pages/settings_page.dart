import 'package:flutter/material.dart';
import 'package:studyflow/data/notifieres.dart';
import 'package:studyflow/views/pages/welcome_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
    required this.title,
  }); //Titel wird aus anderer Seite angefragt und auf dieser eingesetzt. Test zum verschicken von Daten zwischen Seiten

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0; //beim Start auf 0
  String? menuItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ), //widget davor, da StatefulWidget, kann bei StateLess weggelassen werden
        //automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        //dadurch ist die Seite Scrollbar
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton(
                  value:
                      menuItem, // = 'e1', //dadurch wird e1 direkt ausgweäht. Kann man auch weg lassen, dann halt
                  items: [
                    DropdownMenuItem(value: 'e1', child: Text('Element 1')),
                    DropdownMenuItem(value: 'e2', child: Text('Element 2')),
                    DropdownMenuItem(value: 'e3', child: Text('Element 3')),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      menuItem =
                          value; //dadurch wird das im Dropdownmenu ausgewählte auch ausgewählt
                    });
                  },
                ),
                TextField(
                  controller: controller, // zum Text darstellen
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  onEditingComplete: () =>
                      setState(() {}), // Arrow kann nur einen Befehl haben
                ),
                Text(controller.text),
                Checkbox(
                  tristate: true, //Ceckbox kann dadurch drei werte haben
                  value: isChecked,
                  onChanged: (bool? value) {
                    // bool? kann null sein
                    setState(() {
                      isChecked = value;
                    });
                  },
                ),
                CheckboxListTile.adaptive(
                  tristate: true, //kann drei werte haben
                  title: Text('Profil öffentlich'), //! Title
                  value: isChecked,
                  onChanged: (bool? value) {
                    // bool? kann null sein
                    setState(() {
                      isChecked = value;
                    });
                  },
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                ),
                SwitchListTile.adaptive(
                  // dass .adaptive passt das design ans Betriebssysrtem an
                  title: Text('haölölo'), //! Title

                  value: isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                ),
                Slider(
                  value: sliderValue,
                  max: 10.0, //setzt die Slider größe fest
                  divisions: 10, //Slider nur schrittweise auswählbar
                  onChanged: (double value) {
                    setState(() {
                      sliderValue = value;
                      print(value);
                    });
                  },
                ),
                InkWell(
                  //Das objekt, welches man klickbar gamcht hat, hat einen Splsh effekt
                  splashColor: Colors.amber,
                  onTap: () {
                    print('image selected');
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity, //Bildschirmgröße
                    color: Colors.white12,
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text('klickomio')),
                FilledButton(
                  onPressed: () {
                    selectedPageNotifier.value = 0;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WelcomePage();
                        },
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(backgroundColor: Colors.amber),
                  child: Text('Logout'),
                ),
                Divider(color: Colors.amber, thickness: 4, endIndent: 200),
                TextButton(onPressed: () {}, child: Text('klick mich')),
                OutlinedButton(onPressed: () {}, child: Text('klick mich')),
                CloseButton(),
                BackButton(),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                  ),
                  child: Text('klick mich'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    //Klicbar, ohne Splash
                    onTap: () {
                      print('klicker');
                    },
                    child: Image.asset('assets/images/haw-kiel_ecke.jpg'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
