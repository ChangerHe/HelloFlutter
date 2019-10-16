import 'package:flutter/material.dart';

class PageButton extends StatefulWidget {
  @override
  _PageButtonState createState() => new _PageButtonState();
}

class _PageButtonState extends State<PageButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮1'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: Text('漂浮按钮'),
            ),
            RaisedButton.icon(
              onPressed: () {},
              label: Text('带Icon的漂浮按钮'),
              icon: Icon(Icons.add),
            ),
            FlatButton(
              child: Text('扁平按钮'),
              onPressed: () {},
            ),
            FlatButton(
              child: Container(
                child: Center(
                  child: Text(
                    '自定义的扁平按钮',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                width: 80,
                height: 100,
              ),
              onPressed: () {},
              color: Colors.blue,
              autofocus: true,
              // padding: EdgeInsetsGeometry.lerp(a, b, t),
              // 高亮的颜色
              // highlightColor: Colors.black,
              // 形状设置
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2000),
              ),
              // 向外扩散的颜色
              splashColor: Colors.black,

              disabledColor: Colors.grey,
            ),
            OutlineButton(
              onPressed: () {},
              child: Text('含边框的按钮'),
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
