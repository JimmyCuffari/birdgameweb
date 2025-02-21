import 'package:flutter/material.dart';

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
  int _counter = 0;

  late TabController _controller;

  List<String> birdPics = <String>[
    "lib/assets/Cardinal.jpg",
    "lib/assets/Chickadee.jpg",
    "lib/assets/Finch.jpg",
    "lib/assets/Gull.jpg",
    "lib/assets/Hawk.jpg",
    "lib/assets/Robin.jpg",
    "lib/assets/Sparrow.jpg",
    "lib/assets/Wren.jpg",
  ];

  List<String> birdNames = <String>['Cardinal', 'Robin', 'Sparrow', 'Wren'];
  String? _selectedName;

  List<String> birdSongs = <String>['Song A', 'Song B', 'Song C', 'Song D'];
  String? _selectedSong;

  @override
  void initState() {
    _controller = new TabController(length: 3, vsync: this);
  }

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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        birdPics[_counter],
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.values[3],

          //mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
                    width: 70,
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 6, 0, 0),
                          child: Text(
                            'Score:\n' + '$_counter',
                          )),
                    )),
              ],
            ),
            Container(
                padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
                //width: ,
                child: Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton<String>(
                        value: _selectedName, // Bind selected value
                        items: birdNames.map((name) {
                          return DropdownMenuItem<String>(
                            value: name,
                            child: Text(name),
                          );
                        }).toList(),
                        hint: Text("Bird Name"),
                        onChanged: (newVal) {
                          setState(() {
                            _selectedName = newVal; // Update state
                          });
                        }))),
            Container(
                padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
                //width: ,
                child: Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton<String>(
                        value: _selectedSong, // Bind selected value
                        items: birdSongs.map((song) {
                          return DropdownMenuItem<String>(
                            value: song,
                            child: Text(song),
                          );
                        }).toList(),
                        hint: Text("Bird Song"),
                        onChanged: (newVal) {
                          setState(() {
                            _selectedSong = newVal; // Update state
                          });
                        }))),
          ]),
      Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.all(30),
          child: ElevatedButton(
              onPressed: _incrementCounter, child: Text("Submit")))
    ]));
  }
}
