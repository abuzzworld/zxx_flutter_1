import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(100),
      width: 100,
      height: 100,
      child: Text("data"),
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      // foregroundDecoration: BoxDecoration(
      //   color: Colors.red,
      // ),
      // transform: Matrix4.rotationZ(0.5),
    );

    // return ConstrainedBox(
    //   constraints: BoxConstraints(
    //     maxHeight: 100,
    //     minHeight: 50,
    //     maxWidth: 200,
    //     minWidth: 100,
    //   ),
    //   child: Container(
    //     width: 10,
    //     height: 500,
    //     color: Colors.black,
    //   ),
    // );

    // 父容器有指定宽高就使用
    // return SizedBox(
    //   width: 100,
    //   height: 100,
    //   child: Container(
    //     width: 200,
    //     height: 10,
    //     color: Colors.yellow,
    //   ),
    // );

    // 渐变、圆角、边框、阴影 等等等都可以用这个实现
    // return Container(
    //   margin: EdgeInsets.all(20),
    //   width: double.infinity,
    //   child: DecoratedBox(
    //     decoration: BoxDecoration(
    //       // color: Colors.red,
    //       gradient: LinearGradient(
    //         colors: [Colors.red, Colors.green],
    //       ),
    //       borderRadius: BorderRadius.circular(20.0),
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.black,
    //           offset: Offset(2.0, 6.0),
    //           blurRadius: 2,
    //         ),
    //       ],
    //     ),
    //     child: Padding(
    //       padding: EdgeInsets.only(
    //         left: 100,
    //         right: 100,
    //         top: 20,
    //         bottom: 20,
    //       ),
    //       child: Text(
    //         "data",
    //         style: TextStyle(
    //           color: Colors.white,
    //         ),
    //         textAlign: TextAlign.center,
    //       ),
    //     ),
    //   ),
    // );
  }
}
