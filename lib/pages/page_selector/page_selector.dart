import 'package:flutter/material.dart';

class PageSelector extends StatefulWidget {
  @override
  _PageSelectorState createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  bool _switchSelected = false;
  bool _checkboxSelected = false;
  TextEditingController _unameController = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    //监听输入改变
    _unameController.addListener(() {
      print(_unameController.text);
    });
    // TODO: 聚焦监听未生效?
    focusNode2.addListener(() {
      print('$focusNode2 focusNode1');
      print('$focusNode2.hasFocus ');
    });
    // 设置text 的默认值
    _unameController.text = 'hello world';
    // 设置选中第二个字符后面的字符
    _unameController.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _unameController.text.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('单选和复选框'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Switch(
              onChanged: (value) {
                print('$value value');
                setState(() {
                  _switchSelected = value;
                });
              },
              value: _switchSelected,
              activeColor: Colors.red,
            ),
            Checkbox(
              onChanged: (value) {
                print('$value value');
                setState(() {
                  _checkboxSelected = value;
                });
              },
              value: _checkboxSelected,
            ),
            TextField(
              controller: _unameController,
              focusNode: focusNode1,
              decoration: InputDecoration(
                labelText: '账号',
                prefixIcon: Icon(Icons.account_circle),
              ),
              keyboardType: TextInputType.datetime,
              autofocus: true,
              onChanged: (v) {
                print('$v onchanged');
              },
            ),
            TextField(
              // controller: ,
              focusNode: focusNode2,
              decoration: InputDecoration(
                labelText: '密码',
                prefixIcon: Icon(Icons.lock),
                hintText: '你的密码',
                // 此处的设置无效
                border: UnderlineInputBorder(
                  //下面代码没有效果
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
              ),
              keyboardType: TextInputType.datetime,
            ),
            Builder(
              builder: (ctx) {
                return Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('移动焦点'),
                      onPressed: () {
                        FocusScope.of(ctx).requestFocus(focusNode2);
                      },
                    ),
                    RaisedButton(
                      child: Text('隐藏键盘'),
                      onPressed: () {
                        focusNode1.unfocus();
                        focusNode2.unfocus();
                      },
                    ),
                  ],
                );
              },
            ),
            // TextField在绘制下划线时使用的颜色是主题色里面的hintColor, 和提示文本颜色是一样的
            Theme(
                data: Theme.of(context).copyWith(
                  hintColor: Colors.grey[200], //定义下划线颜色
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.red,
                    ), //定义label字体样式
                    hintStyle: TextStyle(
                      color: Colors.yellow,
                      fontSize: 14.0,
                    ), //定义提示文本样式
                  ),
                ),
                child: Form(
                  key: _formKey,
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "用户名或邮箱",
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (v) =>
                            v.trim().length > 0 ? null : "用户名不能为空",
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "密码",
                          hintText: "您的登录密码",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 13.0,
                          ),
                        ),
                        obscureText: true,
                        validator: (v) =>
                            v.trim().length > 5 ? null : '密码不能少于6位',
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 28),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                onPressed: () {
                                  print(Form.of(context));
                                  if ((_formKey.currentState as FormState)
                                      .validate()) {
                                    //验证通过提交数据
                                    print('验证通过');
                                  }
                                },
                                color: Theme.of(context).primaryColor,
                                textColor: Colors.white,
                                child: Text('登陆'),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
