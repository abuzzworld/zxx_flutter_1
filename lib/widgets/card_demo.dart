import 'package:flutter/material.dart';

class CardDemo extends StatefulWidget {
  const CardDemo({Key? key}) : super(key: key);

  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  var _list = <Map>[];

  @override
  void initState() {
    // TODO: implement initState

    for (var i = 0; i < 10; i++) {
      _list.add({
        "age": 10 + i,
        "name": "wang_" + i.toString(),
      });
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
      // color: Colors.red,
      // shadowColor: Colors.green,
      elevation: 10,
      child: Column(
        children: [
          SizedBox(height: 8),
          Text(_list[index]["name"]),
          SizedBox(height: 8),
          Text(_list[index]["age"].toString()),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("card")),
      body: Padding(
        padding: EdgeInsets.all(10),
        // child: ListView(
        //   children: [
        //     Card(
        //       child: Container(
        //         width: double.infinity,
        //         height: 200,
        //       ),
        //     ),
        //   ],
        // ),

        // child: ListView.builder(
        //   itemBuilder: _itemBuilder,
        //   itemCount: _list.length,
        // ),

        child: ListView(
          children: [
            ListTile(
              title: Text("title"),
              tileColor: Colors.red,
              subtitle: Text("subtitle"),
              leading: Icon(Icons.add),
              trailing: Icon(Icons.home),
            ),
          ],
        ),
      ),
    );
  }
}
