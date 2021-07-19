import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({Key? key}) : super(key: key);

  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  var list = <int>[];

  @override
  void initState() {
    // TODO: implement initState
    for (var i = 0; i < 100; i++) {
      list.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("dialog")),
      body: Column(
        children: [
          RaisedButton(
            onPressed: _showAlert,
            child: Text("对话框"),
          ),
          RaisedButton(
            onPressed: _showListDialog,
            child: Text("列表对话框"),
          )
        ],
      ),
    );
  }

  void _showListDialog() async {
    var result = await showDialog(
      // 点击空白处关闭
      barrierDismissible: false,
      context: context,
      builder: (context) {
        // ios 风格 cupertino 开头一般ios风格
        return SimpleDialog(
          title: Text("标题"),
          children: list
              .map((e) => GestureDetector(
                    child: Text(e.toString()),
                    onTap: () {
                      Navigator.pop(context, e.toString());
                    },
                  ))
              .toList(),
        );

        // return AlertDialog(
        //   title: Text("标题"),
        //   content: Text("提示内容"),
        //   actions: [
        //     FlatButton(
        //         onPressed: () {
        //           Navigator.of(context).pop(true);
        //         },
        //         child: Text("确认")),
        //     FlatButton(
        //         onPressed: () {
        //           Navigator.pop(context, false);
        //         },
        //         child: Text("取消")),
        //   ],
        // );
      },
    );
    print(result);
  }

  void _showAlert() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        // ios 风格 cupertino 开头一般ios风格
        return CupertinoAlertDialog(
          title: Text("标题"),
          content: Text("提示内容"),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text("确认")),
            FlatButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text("取消")),
          ],
        );

        // return AlertDialog(
        //   title: Text("标题"),
        //   content: Text("提示内容"),
        //   actions: [
        //     FlatButton(
        //         onPressed: () {
        //           Navigator.of(context).pop(true);
        //         },
        //         child: Text("确认")),
        //     FlatButton(
        //         onPressed: () {
        //           Navigator.pop(context, false);
        //         },
        //         child: Text("取消")),
        //   ],
        // );
      },
    );
    print(result);
  }
}
