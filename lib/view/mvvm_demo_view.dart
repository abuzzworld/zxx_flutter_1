import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zxx_flutter_1/viewmodel/mvvm_demo_viewmodel.dart';

class MvvmDemoView extends StatefulWidget {
  const MvvmDemoView({Key? key}) : super(key: key);

  @override
  _MvvmDemoViewState createState() => _MvvmDemoViewState();
}

class _MvvmDemoViewState extends State<MvvmDemoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MVVM"),
      ),
      body: ElevatedButton(
        onPressed: () async {
          context.read<MvvmDemoViewModel>().get("id");
        },
        child: Text("MVVM"),
      ),
    );
  }
}
