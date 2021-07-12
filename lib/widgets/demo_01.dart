import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// 文本
class TextDemo extends StatelessWidget {
  const TextDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.green,
      child: Text(
        "djalfjaldfja" * 20,
        maxLines: 12,
        overflow: TextOverflow.fade,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red, fontSize: 28),
      ),
    );
  }
}

// 按钮
class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          onPressed: () {},
          child: Text("afafa"),
        ),
        FlatButton(onPressed: () {}, child: Text("1231231x")),
        FlatButton.icon(
            onPressed: () {}, icon: Icon(Icons.add), label: Text("label")),
        OutlineButton(
          onPressed: () {},
          child: Text("131231231"),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.add))
      ],
    );
  }
}

// 图片
class ImageIconDemo extends StatelessWidget {
  const ImageIconDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.add),
        IconButton(onPressed: () {}, icon: Icon(Icons.home)),
        Container(
          width: double.infinity,
          child: Image.network(
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.nga.178.com%2Fattachments%2Fmon_202106%2F04%2Fi2Q2o-3wlvZzT3cShj-cz.jpg.thumb.jpg&refer=http%3A%2F%2Fimg.nga.178.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1628657885&t=1e8eb7c08e8dd1dc61e4be6802cc4c63",
            fit: BoxFit.fill,
          ),
        ),
        Image.asset("images/keli.jpeg")
      ],
    );
  }
}

// 勾选框
class CheckDemo extends StatefulWidget {
  const CheckDemo({Key? key}) : super(key: key);

  @override
  _CheckDemoState createState() => _CheckDemoState();
}

class _CheckDemoState extends State<CheckDemo> {
  bool _check = false;
  bool _switch = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Checkbox(
          value: _check,
          onChanged: (v) {
            setState(() {
              // _check = v ?? true;
              _check = v!;
            });
          },
        ),
        Switch(
          value: _switch,
          onChanged: (v) {
            setState(() {
              // _check = v ?? true;
              _switch = v;
            });
          },
        ),
      ],
    );
  }
}

// 进度指示器
class ProgressDemo extends StatelessWidget {
  const ProgressDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: .5,
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
          SizedBox(height: 50),
          Container(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              value: .5,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
          ),
          SizedBox(height: 50),
          CupertinoActivityIndicator(
            radius: 50,
          ),
        ],
      ),
    );
  }
}

// 点击
class ClickDemo extends StatelessWidget {
  const ClickDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: GestureDetector(
        onTap: () {
          print("single");
        },
        onDoubleTap: () {
          print("double");
        },
        child: Text("click"),
      ),
    );
  }
}

// 输入框
class InputDemo extends StatefulWidget {
  const InputDemo({Key? key}) : super(key: key);

  @override
  _InputDemoState createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  GlobalKey _key = GlobalKey<FormState>();
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();
  FocusNode _userNode = FocusNode();
  FocusNode _passNode = FocusNode();
  FocusScopeNode? _fNode;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _user.dispose();
    _pass.dispose();
    _userNode.dispose();
    _passNode.dispose();
    if (_fNode != null) {
      _fNode?.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        // autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              focusNode: _userNode,
              controller: _user,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add),
                  labelText: "账号",
                  hintText: "请输入账号"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "不能为空";
                } else {}
              },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (value) {
                print("object");
              },
              // onChanged: (value) {
              //   print(value);
              // },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              focusNode: _passNode,
              controller: _pass,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add),
                  labelText: "密码",
                  hintText: "请输入密码"),
              obscureText: true,
              validator: (value) {
                if (value == null || value.length < 5) {
                  return "密码长度必须大于5";
                }
              },
              textInputAction: TextInputAction.send,
              // onChanged: (value) {
              //   print(value);
              // },
            ),
            SizedBox(
              height: 50,
            ),
            // TextField(
            //   controller: _controller,
            //   decoration: InputDecoration(
            //       prefixIcon: Icon(Icons.add),
            //       labelText: "aaaaa",
            //       hintText: "bbbbb"),
            //   obscureText: false,
            //   // onChanged: (value) {
            //   //   print(value);
            //   // },
            // ),
            SizedBox(height: 50),
            RaisedButton(
              onPressed: () {
                if (_fNode == null) {
                  _fNode = FocusScope.of(context);
                }
                _fNode?.requestFocus(_userNode);
                // _fNode?.unfocus();  // 取消全部焦点
                print((_key.currentState as FormState).validate().toString());
                // print(_user.text);
              },
              child: Text("tijiao"),
            )
          ],
        ));
  }
}
