import 'package:flutter/foundation.dart';

class CountProvider extends ChangeNotifier {
  var _count = 0;

  get count => _count;

  void add() {
    _count++;
    notifyListeners();
  }
}
