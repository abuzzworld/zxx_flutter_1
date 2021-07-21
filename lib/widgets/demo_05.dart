import 'package:flutter/material.dart';

class Demo05 extends StatefulWidget {
  const Demo05({Key? key}) : super(key: key);

  @override
  _Demo05State createState() => _Demo05State();
}

class _Demo05State extends State<Demo05> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.red,
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.yellow,
            child: CountDemo(),
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class CountDemo extends StatefulWidget {
  const CountDemo({Key? key}) : super(key: key);

  @override
  _CountDemoState createState() => _CountDemoState();
}

class _CountDemoState extends State<CountDemo> {
  var _count = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(_count.toString()),
      onTap: () {
        setState(() {
          _count++;
        });
      },
    );
  }
}
