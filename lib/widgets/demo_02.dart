import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("navigator"),
      ),
      body: RaisedButton(
        onPressed: () async {
          // var result = await Navigator.of(context).popAndPushNamed(
          //   "menu",
          //   arguments: {"name": "1111111"},
          // );
          var result = await Navigator.of(context).pushNamed(
            "menu",
            arguments: {"name": "1111111"},
          );
          // var result = await Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return MenuPage();
          //     },
          //     maintainState: false,
          //     fullscreenDialog: false,
          //     settings: RouteSettings(
          //       name: "menu",
          //       arguments: {"name": "1111111"},
          //     ),
          //   ),
          // );
          print(result);
        },
        child: Text("按钮"),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);
  // final String title;

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.toString()),
      ),
      body: RaisedButton(
        onPressed: () {
          Navigator.of(context).pop({
            "name": "返回",
          });
        },
        child: Text("fanhui"),
      ),
    );
  }
}
