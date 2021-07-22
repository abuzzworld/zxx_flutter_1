import 'package:dio/dio.dart';

class MvvmDemoModel {
  dynamic get(String id) async {
    return await Dio()
        .get("http://api.td0f7.cn:8083/dio/dio/test", queryParameters: {
      "id": id,
    });
  }
}
