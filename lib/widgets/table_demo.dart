import 'package:flutter/material.dart';

class TableDemo extends StatefulWidget {
  const TableDemo({Key? key}) : super(key: key);

  @override
  _TableDemoState createState() => _TableDemoState();
}

class _TableDemoState extends State<TableDemo> {
  var _list = <Map>[];
  var _sortColumnIndex = 0;
  var _sortAscending = true;

  @override
  void initState() {
    super.initState();
    for (var i = 1; i < 11; i++) {
      _list.add({
        // "name": "wang_" + i.toString(),
        "name": "w" * i,
        "gender": i % 2 == 0 ? "男" : "女",
        "select": false,
        "age": i,
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
        // child: Table(
        //   border: TableBorder.all(color: Colors.green),
        //   children: _list
        //       .map((e) => TableRow(children: [
        //             Text(e["name"]),
        //             Text(e["gender"]),
        //           ]))
        //       .toList(),
        // ),

        child: DataTable(
          // onSelectAll: (value) {
          //   for (var i = 0; i < _list.length; i++) {
          //     setState(() {
          //       if (_list[i]["select"] != value) {
          //         _list[i]["select"] = value;
          //       }
          //     });
          //   }
          // },
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,
          columns: [
            DataColumn(
              label: Text("姓名"),
              onSort: (columnIndex, ascending) {
                setState(() {
                  _sortColumnIndex = columnIndex;
                  _sortAscending = ascending;
                  _list.sort((a, b) {
                    if (!ascending) {
                      var c = a;
                      a = b;
                      b = c;
                    }
                    return a["name"]
                        .toString()
                        .length
                        .compareTo(b["name"].toString().length);
                  });
                });
              },
            ),
            DataColumn(
              label: Text("年龄"),
              onSort: (columnIndex, ascending) {
                setState(() {
                  _sortColumnIndex = columnIndex;
                  _sortAscending = ascending;
                  _list.sort((a, b) {
                    if (!ascending) {
                      var c = a;
                      a = b;
                      b = c;
                    }
                    return a["age"].compareTo(b["age"]);
                  });
                });
              },
            ),
            DataColumn(label: Text("性别")),
          ],
          rows: _list
              .map(
                (e) => DataRow(
                  selected: e["select"],
                  onSelectChanged: (value) {
                    setState(() {
                      if (e["select"] != value) {
                        e["select"] = value;
                      }
                    });
                  },
                  cells: [
                    DataCell(Text(e["name"])),
                    DataCell(Text(e["age"].toString())),
                    DataCell(Text(e["gender"])),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
