import 'package:flutter/material.dart';

class PageDemo extends StatefulWidget {
  // const PageDemo({Key? key}) : super(key: key);
  final List<Widget> widgets = [FlutterView(), AndroidView(), IosView()];
  @override
  _PageDemoState createState() => _PageDemoState();
}

class _PageDemoState extends State<PageDemo>
    with SingleTickerProviderStateMixin {
  var _tabs = ["Flutter", "Android", "iOS"];
  TabController? _controller;
  var _index = 0;
  @override
  void initState() {
    // TODO: implement initState
    _controller = TabController(
      initialIndex: _index,
      length: _tabs.length,
      vsync: this,
    );
    // _controller?.addListener(() {
    //   setState(() {
    //     _index = _controller?.index ?? 0;
    //   });
    // });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // 标题居中
        title: Text("TabBar"),
        // leading: IconButton(
        //   icon: Icon(Icons.home),
        //   onPressed: () {
        //     print("object");
        //   },
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print("object");
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print("object");
            },
          ),
        ],
        elevation: 4.0, // 阴影
        bottom: TabBar(
          controller: _controller,
          tabs: _tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        children: widget.widgets,
        controller: _controller,
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text("data"),
            ),
          ],
        ),
        removeTop: true,
      ),
    );
  }
}

class FlutterView extends StatelessWidget {
  const FlutterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Flutter"),
    );
  }
}

class AndroidView extends StatelessWidget {
  const AndroidView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Android"),
    );
  }
}

class IosView extends StatelessWidget {
  const IosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("IOS"),
    );
  }
}
