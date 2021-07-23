import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioDemo extends StatefulWidget {
  const DioDemo({Key? key}) : super(key: key);

  @override
  _DioDemoState createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  var _dio = Dio();

  @override
  void initState() {
    super.initState();
    _dio.options.baseUrl = "http://api.td0f7.cn:8083/";
    // 超时：单位 毫秒
    _dio.options.connectTimeout = 1000;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("dio")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _get,
            child: Text("Get"),
          ),
          ElevatedButton(
            onPressed: _post,
            child: Text("Post"),
          ),
          ElevatedButton(
            onPressed: _try,
            child: Text("Tty Catch"),
          )
        ],
      ),
    );
  }

  void _try() async {
    try {
      print("object");
      dynamic result = await _dio.get("/dio/dio/time");
      print(result);
      throw "测试异常";
    } on DioError {
      // 可以指定错误类型
      print("object   dio error");
    } on String {
      print("object   string");
    } catch (e) {
      print(e.toString());
      print(e.runtimeType);
    }
  }

  void _post() async {
    var result1 = await _dio.post(
      "dio/dio",
      queryParameters: {
        "id": 1,
      },
      options: Options(headers: {
        "token": "sfdsfsdfs",
      }),
    );
    print(result1);
  }

  void _get() async {
    var result = await _dio.get("dio/dio/test", queryParameters: {
      "id": 1,
    });
    print(result);
    var result1 = await _dio.get(
      "dio/dio",
      queryParameters: {
        "id": 1,
      },
      options: Options(headers: {
        "token": "sfdsfsdfs",
      }),
    );
    print(result1);
  }
}
