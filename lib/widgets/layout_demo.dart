import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zxx_flutter_1/widgets/container_demo.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局练习"),
      ),
      body: Container(
        color: Colors.grey,
        child: ContainerDemo(),
      ),
    );
  }
}

// 边距
class EdgeDemo extends StatelessWidget {
  const EdgeDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.red,
      // 外边距-距离父组件
      // margin: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10, top: 10),
      // 内边距-距离子组件
      padding: EdgeInsets.all(10),
      child: Text("text"),
    );
  }
}

// 相对定位
class AlignDemo extends StatelessWidget {
  const AlignDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(90),
      width: 200,
      height: 200,
      color: Colors.green,
      child: Align(
        // 相对父组件定位
        // alignment: Alignment.bottomCenter,
        alignment: Alignment(0, -0.8),
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }
}

// 层叠布局
class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey,
      child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.red,
            width: 50,
            height: 50,
          ),
          Positioned(
              top: 50,
              left: 50,
              right: 10,
              // width: 200,
              height: 200,
              child: Container(
                color: Colors.yellow,
                // width: 250,
                // height: 250,
              ))
        ],
      ),
    );
  }
}

// 流式布局
class WarpDemo extends StatefulWidget {
  const WarpDemo({Key? key}) : super(key: key);

  @override
  _WarpDemoState createState() => _WarpDemoState();
}

class _WarpDemoState extends State<WarpDemo> {
  // ignore: deprecated_member_use
  // List<int> list = List.filled(0, 0);
  List<int> list = List.generate(20, (index) => index + 1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // for (var i = 0; i < 20; i++) {
    //   list.add(i);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.end,
      spacing: 10,
      runSpacing: 10,
      children: list
          .map(
            (e) => Container(
              height: 100,
              width: 100,
              child: Text(e.toString()),
              color: Colors.blue,
            ),
          )
          .toList(),
    );
  }
}

class FlexDemo extends StatelessWidget {
  const FlexDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            width: 100,
            height: 200,
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            width: 100,
            height: 200,
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
            width: 100,
            height: 200,
          ),
          flex: 1,
        ),
      ],
    );
  }
}

class RowDemo extends StatelessWidget {
  const RowDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      textDirection: TextDirection.ltr,
      children: [
        Container(
          color: Colors.red,
          width: 100,
          height: 200,
        ),
        Container(
          color: Colors.green,
          width: 150,
          height: 10,
        ),
        Container(
          color: Colors.yellow,
          width: 100,
          height: 100,
        ),
      ],
    );
  }
}

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          width: 100,
          height: 100,
        ),
        Container(
          color: Colors.green,
          width: 150,
          height: 100,
        ),
        Container(
          color: Colors.yellow,
          width: 100,
          height: 100,
        ),
      ],
    );
  }
}
