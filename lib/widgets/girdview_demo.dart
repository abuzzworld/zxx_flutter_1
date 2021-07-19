import 'package:flutter/material.dart';

class GirdviewDemo extends StatefulWidget {
  const GirdviewDemo({Key? key}) : super(key: key);

  @override
  _GirdviewDemoState createState() => _GirdviewDemoState();
}

class _GirdviewDemoState extends State<GirdviewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("gird")),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        children: [
          Container(color: Colors.red),
          Container(color: Colors.red),
          Container(color: Colors.red),
          Container(color: Colors.red),
          Container(color: Colors.red),
          Container(color: Colors.red),
          Container(color: Colors.red),
          Container(color: Colors.red),
          Container(color: Colors.red),
        ],
      ),
    );
  }
}
