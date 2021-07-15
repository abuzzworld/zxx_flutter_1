import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  var list = <int>[];
  ScrollController? _controller;
  var _showButton = false;
  @override
  void initState() {
    // TODO: implement initState
    for (var i = 0; i < 100; i++) {
      list.add(i);
    }
    _controller = ScrollController();
    _controller?.addListener(() {
      if ((_controller?.offset ?? 0) >= 500 && _showButton == false) {
        setState(() {
          _showButton = true;
        });
      } else if ((_controller?.offset ?? 0) < 500 && _showButton == true) {
        setState(() {
          _showButton = false;
        });
      }
      print(_controller);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表"),
      ),
      floatingActionButton: _showButton
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                // 点击返回顶部
                _controller?.animateTo(
                  0,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.bounceIn,
                );
              },
            )
          : null,
      // 加进度条
      body: Scrollbar(
        // child: RefreshIndicator(
        //   child: ListView(
        //     children: list.map((e) => Text(e.toString())).toList(),
        //     // shrinkWrap: true,
        //     // reverse: true,
        //     itemExtent: 50, // 高度
        //   ),
        //   onRefresh: _pullRefresh,
        // ),

        child: ListView.builder(
          // 方向
          // scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            if (index % 2 == 0) {
              return Icon(Icons.add);
            }
            return Text(list[index].toString());
          },
          itemExtent: 40,
          itemCount: list.length,
          controller: _controller,
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print("123");
    });
  }
}
