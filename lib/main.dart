import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zxx_flutter_1/provider/CountProvider.dart';
import 'package:zxx_flutter_1/view/mvvm_demo_view.dart';
import 'package:zxx_flutter_1/viewmodel/mvvm_demo_viewmodel.dart';
import 'package:zxx_flutter_1/widgets/alertdialog_demo.dart';
import 'package:zxx_flutter_1/widgets/bottom_navigator.dart';
import 'package:zxx_flutter_1/widgets/card_demo.dart';
import 'package:zxx_flutter_1/widgets/demo_01.dart';
import 'package:zxx_flutter_1/widgets/demo_02.dart';
import 'package:zxx_flutter_1/widgets/demo_05.dart';
import 'package:zxx_flutter_1/widgets/dio_demo.dart';
import 'package:zxx_flutter_1/widgets/girdview_demo.dart';
import 'package:zxx_flutter_1/widgets/layout_demo.dart';
import 'package:zxx_flutter_1/widgets/listview_demo.dart';
import 'package:zxx_flutter_1/widgets/page_demo.dart';
import 'package:zxx_flutter_1/widgets/provider_demo.dart';
import 'package:zxx_flutter_1/widgets/table_demo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CountProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => MvvmDemoViewModel(),
      ),
    ],
    child: MyApp(),
  ));
  // 只能返回一个 Provider
  // runApp(ChangeNotifierProvider(
  //   create: (context) => CountProvider(),
  //   child: MyApp(),
  // ));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
      routes: {
        "/": (context) => LoginPage(), // 不用 initialRoute 初始路由的话  “/” 是默认主页
        "layout": (context) => LayoutDemo(),
        "page": (context) => PageDemo(),
        "bottomNavi": (context) => BottomNavigatorBarDemo(),
        "listView": (context) => ListViewDemo(),
        "girdview": (context) => GirdviewDemo(),
        "alergdialog": (context) => AlertDialogDemo(),
        "table": (context) => TableDemo(),
        "card": (context) => CardDemo(),
        "demo05": (context) => Demo05(),
        "provider": (context) => ProviderDemo(),
        "providertwo": (context) => ProviderDemoTwo(),
        "dio": (context) => DioDemo(),
        "mvvm": (context) => MvvmDemoView(),
        // "menu": (context) => MenuPage(),
      },
      // initialRoute: "layout", // (初始路由)重置主页
      initialRoute: "mvvm", // (初始路由)重置主页

      // 路由拦截
      onGenerateRoute: (settings) {
        print(settings.name);
        switch (settings.name) {
          case "menu":
            return MaterialPageRoute(
              builder: (context) {
                return MenuPage();
              },
              settings: settings,
            );
            // ignore: dead_code
            break;
          default:
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("alfjafalfja"),
        elevation: 10.0,
        centerTitle: true,
      ),
      body: InputDemo(),
    );
  }
}

class CountPage extends StatefulWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$count"),
        IconButton(
          icon: Icon(Icons.thumb_up),
          onPressed: () {
            setState(() {
              count++;
            });
          },
        )
      ],
    );
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page '),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
