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
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xff2196f3),
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
  final _titles = <String>[];
  final _descriptions = <String>[];
  final _checked = <bool>[];
  final _deadlines = <String>[];

  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  DateTime? _selectedDate;

  void _add() {
    if (_titleCtrl.text.trim().isEmpty &&
        _descCtrl.text.trim().isEmpty &&
        _selectedDate == null) return;

    setState(() {
      _titles.add(_titleCtrl.text.trim());
      _descriptions.add(_descCtrl.text.trim());
      _checked.add(false);
      _deadlines.add(
          _selectedDate != null ? _formatDate(_selectedDate!) : '期限なし');

      _titleCtrl.clear();
      _descCtrl.clear();
      _selectedDate = null;
    });
  }

  String _formatDate(DateTime date) {
    return '${date.year}/${date.month}/${date.day}';
  }

  void _pickDate() async {
    DateTime now = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ToDo')),
      body: Column(children: [
        // 入力欄全体（背景付き）
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _titleCtrl,
                  decoration: InputDecoration(
                    hintText: 'タイトル',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _descCtrl,
                  decoration: InputDecoration(
                    hintText: '説明',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? '期限: 未設定'
                            : '期限: ${_formatDate(_selectedDate!)}',
                      ),
                    ),
                    TextButton.icon(
                      onPressed: _pickDate,
                      icon: Icon(Icons.calendar_today),
                      label: Text('日付を選択'),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: _add,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // タスクリスト表示
        Expanded(
          child: ListView.builder(
            itemCount: _titles.length,
            itemBuilder: (c, i) {
              final done = _checked[i];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: done ? Colors.grey[200] : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ListTile(
                  leading: Checkbox(
                    value: done,
                    onChanged: (v) => setState(() => _checked[i] = v!),
                  ),
                  title: Text(
                    _titles[i],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: done ? Colors.grey[700] : Colors.black,
                      decoration: done ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_descriptions[i].isNotEmpty)
                        Text(
                          _descriptions[i],
                          style: TextStyle(
                            color: done ? Colors.grey[600] : Colors.black87,
                          ),
                        ),
                      Text(
                        '期限: ${_deadlines[i]}',
                        style: TextStyle(
                          color: done ? Colors.grey : Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  trailing: done
                      ? IconButton(
                          icon: Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _titles.removeAt(i);
                              _descriptions.removeAt(i);
                              _deadlines.removeAt(i);
                              _checked.removeAt(i);
                            });
                          },
                        )
                      : null,
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
