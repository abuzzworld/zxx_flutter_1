import 'package:flutter/material.dart';
import 'package:zxx_flutter_1/provider/CountProvider.dart';
import 'package:zxx_flutter_1/widgets/demo_05.dart';
import 'package:provider/provider.dart';

class ProviderDemo extends StatefulWidget {
  const ProviderDemo({Key? key}) : super(key: key);

  @override
  _ProviderDemoState createState() => _ProviderDemoState();
}

class _ProviderDemoState extends State<ProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider")),
      body: Column(
        children: [
          Text(Provider.of<CountProvider>(context).count.toString()),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("providertwo");
            },
            child: Text("跳转"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<CountProvider>().add();
        },
      ),
    );
  }
}

class ProviderDemoTwo extends StatelessWidget {
  const ProviderDemoTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider demo two"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          context.read<CountProvider>().add();
        },
      ),
    );
  }
}
