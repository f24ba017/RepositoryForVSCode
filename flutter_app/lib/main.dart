import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ガチャ集計アプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xff2196f3),
        canvasColor: const Color(0xfffafafa),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _totalCount = 0;
  int _puCount = 0;
  int _star5Count = 0;
  int _suriCount = 0;

  void _incrementTotalOnly() {
    setState(() {
      _totalCount++;
    });
  }

  void _incrementStar5() {
    setState(() {
      _totalCount++;
      _star5Count++;
      _suriCount++;
    });
  }

  void _incrementPU() {
    setState(() {
      _totalCount++;
      _puCount++;
      _star5Count++;
    });
  }

  String _calculatePUProbability() {
    if (_totalCount == 0) return '0.0%';
    double percent = _puCount / _totalCount * 100;
    return '${(percent * 10).roundToDouble() / 10}%';
  }

  String _calculateNoSuriProbability() {
    if (_star5Count == 0) return '0.0%';
    double percent = _puCount / _star5Count * 100;
    return '${(percent * 10).roundToDouble() / 10}%';
  }

  Widget buildDataRow(String label, String value, {Color? valueColor}) {
  return Container(
    width: 300,
    margin: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Container(
          width: 190,
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            softWrap: false,
          ),
        ),
        Container(
          width: 10,
          alignment: Alignment.center,
          child: Text(
            '：',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              color: Colors.lightBlue[100],
            ),
            Center(
              child: Stack(
                children: [
                  Text(
                    'ガチャ集計アプリ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 4
                        ..color = Colors.lightBlue,
                    ),
                  ),
                  Text(
                    'ガチャ集計アプリ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _incrementTotalOnly,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 48),  // サイズ大きめ（例：120×48）
                    ),
                    child: Text(
                      '星5以外',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: _incrementStar5,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 48),
                    ),
                    child: Text(
                      '星5すり抜け',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: _incrementPU,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 48),
                      backgroundColor: Colors.orangeAccent,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      '星5PU',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              buildDataRow('ガチャを引いた回数', '$_totalCount 回'),
              buildDataRow('PUを引いた回数', '$_puCount 回'),
              buildDataRow('星5を引いた回数', '$_star5Count 回'),
              buildDataRow('すり抜けた回数', '$_suriCount 回'),
              buildDataRow('星5PUの確率', _calculatePUProbability(), valueColor: Colors.deepPurple),
              buildDataRow('すり抜けなかった確率', _calculateNoSuriProbability(), valueColor: Colors.teal),
            ],
          ),
        ),
      ),
    );
  }
}