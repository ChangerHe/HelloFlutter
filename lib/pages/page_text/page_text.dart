import 'package:flutter/material.dart';

class PageText extends StatelessWidget {

  _tapRecognizer() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text 测试'),),
      body: DefaultTextStyle(style: TextStyle(color: Colors.green), child: Column(
        children: <Widget>[
          // 普通文本
          Text('普通text'),
          Divider(),
          // 普通文本如果有重复的, 直接填入*加上重复次数
          Text("Hello world! I'm Jack. " * 4),
          Divider(),
          // maxLines决定了最大行数, overflow代表超出的显示方式
          Text("Hello world! I'm Jack. " * 8,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Divider(),
          // 通过textScaleFactor来决定文本的缩放方式
          Text("Hello world",
            textScaleFactor: 1.5,
          ),
          Divider(),
          // 设置文本的居中, 如果超出则文本会换行, 换行后之后的行如果字数不足, 会居中
          Text("Hello world " * 6, //字符串重复六次
            textAlign: TextAlign.center,
          ),
          Divider(),
          Text("Hello world",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()
                  ..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
            ),
          ),
          Divider(),
          Text.rich(TextSpan(
              children: [TextSpan(
                text: 'Home: ',
                // TODO: 阻止继承无效?
                style: TextStyle(inherit: false),
              ),
              TextSpan(
                text: 'https://changerhe.cn',
                style: TextStyle(
                  color: Colors.blue,
                ),
                // recognizer: _tapRecognizer
              ),
              ]
          ))
        ],)
      ),
    );
  }
}
