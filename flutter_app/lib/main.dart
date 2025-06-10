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
  static var _selected = 'A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                _message,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto"),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Radio<String>(
                    value: 'A',
                    groupValue: _selected,
                    onChanged: checkChanged,
                  ),
                  Text(
                    "radio A",
                    style: TextStyle(fontSize:28.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                  )
                ]
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Radio<String>(
                    value: 'B',
                    groupValue: _selected,
                    onChanged: checkChanged,
                  ),
                  Text(
                    "radio B",
                    style: TextStyle(fontSize:28.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                  )
                ]
            ),
          ],
        ),
      ),
    );
  }

  void checkChanged(String? value){
    setState(() {
      _selected = value ?? 'nodata';
      _message = 'select: $_selected';
    });
  }
}