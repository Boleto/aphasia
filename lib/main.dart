import 'package:aphasia/clock.dart';
import 'package:aphasia/play_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aphasia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Aphasia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterTts flutterTts = FlutterTts();
  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Clock(hours: 12, minutes: 14, seconds: 10),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton.icon(
                    color: Colors.blue,
                    icon: Icon(
                      Icons.access_time,
                      color: Colors.white,
                    ),
                    label: Text('Now',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    onPressed: () {
                      print(DateTime.now());
                      //Code to execute when Floating Action Button is clicked
                      //...
                    },
                  ),
                )
              ],
            ),
            new GestureDetector(child: PlayButton(), onTap: speakOut),
          ],
        ),
      ),
    );
  }

  void speakOut() async {
    //TODO: implement mapping
    await flutterTts.setLanguage("de");
    await flutterTts.setVolume(1.0);
    await flutterTts.speak("Zwölf Uhr Mittags");
  }
}
