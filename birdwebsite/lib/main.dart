import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playAudio(var audio) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(audio + '.wav'));
  }

  void _showpic(var pic) async {
    correctness = Image.asset(pic);
    //sleep(Duration(milliseconds: 1000));
    correctness = Image.asset("lib/assets/empty.png");
  }

  int _counter = 0;

  var choice1; // = Text("Cardinal");
  var choice2; // = Text("Chickadee");
  var choice3; // = Text("Finch");
  var choice4; // = Text("Gull");

  var question1;
  var question2;
  var question3;
  var question4;

  var answer;

  var correctness = Image.asset("lib/assets/empty.png");

  var currbird; // = "Cardinal";

  late TabController _controller;

  List<String> birdNames = <String>[
    'Cardinal',
    'Chickadee',
    'Finch',
    'Gull',
    'Hawk',
    'Robin',
    'Sparrow',
    'Wren'
  ];

  List<String> birdSongs = <String>['Song A', 'Song B', 'Song C', 'Song D'];

  @override
  void initState() {
    _setNextQuestion();

    _controller = new TabController(length: 3, vsync: this);
  }

  var question = Image.asset("lib/assets/Cardinal.jpg");

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _checkAnswer(var answer, var choice) {
    setState(() {
      if (answer == choice) {
        _showpic("lib/assets/checkmark.png");
        //correctness = Image.asset("lib/assets/checkmark.png");
        _playAudio('bell');
      } else {
        _showpic("lib/assets/XPNG.PNG");
        //correctness = Image.asset("lib/assets/XPNG.PNG");
        _playAudio('wrong');
      }
    });
    // sleep(Duration(seconds: 1));
    if (answer == choice) {
      _setNextQuestion();
    }
  }

  void _setNextQuestion() {
    setState(() {
      //var ans = Random().nextInt(4);
      answer = Random().nextInt(birdNames.length);

      var currbird = birdNames[answer];

      _playAudio(currbird);

      var chosen = [answer];
      question = Image.asset("lib/assets/" + currbird + ".jpg");

      var ans = answer;

      while (chosen.contains(ans) || ans == answer) {
        ans = Random().nextInt(birdNames.length);
      }
      chosen.add(ans);
      choice1 = ans;
      while (chosen.contains(ans) || ans == answer) {
        ans = Random().nextInt(birdNames.length);
      }

      chosen.add(ans);
      choice2 = ans;
      while (chosen.contains(ans) || ans == answer) {
        ans = Random().nextInt(birdNames.length);
      }

      chosen.add(ans);
      choice3 = ans;
      while (chosen.contains(ans) || ans == answer) {
        ans = Random().nextInt(birdNames.length);
      }
      choice4 = ans;

      ans = Random().nextInt(3);
      switch (ans) {
        case 0:
          choice1 = answer; //Text(birdNames[answer]);
          break;
        case 1:
          choice2 = answer; //Text(birdNames[answer]);
          break;
        case 2:
          choice3 = answer; //Text(birdNames[answer]);
          break;
        case 3:
          choice4 = answer; //Text(birdNames[answer]);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Stack(
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.values[5],
            //mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                  onTap: () {
                    _playAudio(birdNames[answer]);
                  }, // Image tapped
                  child: question),
              Row(mainAxisAlignment: MainAxisAlignment.values[3], children: [
                Container(
                    padding: EdgeInsets.all(30),
                    width: 175,
                    child: ElevatedButton(
                        onPressed: () {
                          _checkAnswer(answer, choice1);
                        },
                        child: Text(birdNames[choice1]))),
                Container(
                    width: 175,
                    padding: EdgeInsets.all(30),
                    child: ElevatedButton(
                        onPressed: () {
                          _checkAnswer(answer, choice2);
                        },
                        child: Text(birdNames[choice2]))),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.values[3], children: [
                Container(
                    width: 175,
                    padding: EdgeInsets.all(30),
                    child: ElevatedButton(
                        onPressed: () {
                          _checkAnswer(answer, choice3);
                        },
                        child: Text(birdNames[choice3]))),
                Container(
                    width: 175,
                    padding: EdgeInsets.all(30),
                    child: ElevatedButton(
                        onPressed: () {
                          _checkAnswer(answer, choice4);
                        },
                        child: Text(birdNames[choice4]))),
              ]),
            ]),
        Column(
          mainAxisAlignment: MainAxisAlignment.values[5],
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.values[5],
              children: [correctness],
            )
          ],
        )
      ],
    ));
  }
}
