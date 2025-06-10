import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: const Color(0xffe91e63),
        canvasColor: const Color(0xfffafafa),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static var _message = 'ok.';
  static var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('My App'),
      ),

      body: Column(
        children: <Widget>[
          Text(
            _message,
            style: TextStyle(
              fontSize: 32.0,
            ),
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[

              ListTile(
                leading: const Icon(Icons.android, size:32),
                title: const Text('first item',
                  style: TextStyle(fontSize: 28)),
                selected: _index == 1,
                onTap: () {
                  _index = 1;
                  tapTile();
                },
              ),

              ListTile(
                leading: const Icon(Icons.favorite, size:32),
                title: const Text('second item',
                  style: TextStyle(fontSize: 28)),
                selected: _index == 2,
                onTap: () {
                  _index = 2;
                  tapTile();
                },
              ),

              ListTile(
                leading: const Icon(Icons.home, size:32),
                title: const Text('third item',
                  style: TextStyle(fontSize: 28)),
                selected: _index == 3,
                onTap: () {
                  _index = 3;
                  tapTile();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void tapTile() {
    setState(() {
      _message = 'you tapped: No, $_index.';
    });

  }
}