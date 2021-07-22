import 'package:flutter/material.dart';
import 'package:zxx_flutter_1/main.dart';
import 'package:zxx_flutter_1/model/mvvm_demo_model.dart';

class MvvmDemoViewModel extends ChangeNotifier {
  var _model = MvvmDemoModel();

  void get(String id) async {
    var result = await _model.get(id);
    print(result.runtimeType);
    print(result.data);
    print(result.statusCode);
    print(result.statusMessage);
    if (navigatorKey.currentContext != null) {
      Navigator.of(navigatorKey.currentContext!).pushNamed("dio");
    }
  }
}
