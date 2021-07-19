import 'package:flutter/material.dart';

class TableDemo extends StatefulWidget {
  const TableDemo({Key? key}) : super(key: key);

  @override
  _TableDemoState createState() => _TableDemoState();
}

class _TableDemoState extends State<TableDemo> {
  var _list = <Map>[];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      _list.add({
        "name": "wang_" + i.toString(),
        "gender": i % 2 == 0 ? "男" : "女",
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("table"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Table(
          border: TableBorder.all(color: Colors.green),
          children: _list
              .map((e) => TableRow(children: [
                    Text(e["name"]),
                    Text(e["gender"]),
                  ]))
              .toList(),
        ),
      ),
    );
  }
}
