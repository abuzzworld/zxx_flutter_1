import 'package:flutter/material.dart';
import 'package:zxx_flutter_1/widgets/layout_demo.dart';
import 'package:zxx_flutter_1/widgets/page_demo.dart';

class BottomNavigatorBarDemo extends StatefulWidget {
  BottomNavigatorBarDemo({Key? key}) : super(key: key);
  List<Widget> _widgets = [PageDemo(), LayoutDemo()];
  @override
  _BottomNavigatorBarDemoState createState() => _BottomNavigatorBarDemoState();
}

class _BottomNavigatorBarDemoState extends State<BottomNavigatorBarDemo> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("BottomNavigator"),
      // ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 不添加这个属性，达到4个就会消失
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "主页"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "主页"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "主页"),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "邮件"),
        ],
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Theme.of(context).primaryColor,
      //   shape: CircularNotchedRectangle(),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(onPressed: () {}, icon: Icon(Icons.home)),
      //       SizedBox(),
      //       IconButton(onPressed: () {}, icon: Icon(Icons.mail)),
      //     ],
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print("object");
        },
      ),
      body: widget._widgets[_index],
    );
  }
}
