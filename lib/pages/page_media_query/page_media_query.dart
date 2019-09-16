import 'package:flutter/material.dart';

class PageMediaQuery extends StatefulWidget {
  @override
  _PageMediaQueryState createState() => _PageMediaQueryState();
}

class _PageMediaQueryState extends State<PageMediaQuery> {
  List list = List<Widget>();

  @override
  void initState() {
    super.initState();
    list = List<Widget>()..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print('width $width; height $height');

    return Scaffold(
      appBar: AppBar(
        title: Text('媒体查询和流式布局'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height / 2,
            color: Colors.grey,
            child: Wrap(
              //流式布局，
              children: list,
              spacing: 26.0, //设置间距
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddButton() {
    //返回一个手势Widget，只用用于显示事件
    return GestureDetector(
      onTap: () {
        if (list.length < 9) {
          setState(() {
            list.insert(list.length - 1, buildPhoto());
          });
        }
      },
      child: Container(
      margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(8),
        width: 80.0,
        height: 80.0,
        color: Colors.black54,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildPhoto() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8),
      width: 80.0,
      height: 80.0,
      color: Colors.amber,
      child: Center(
        child: Text('照片'),
      ),
    );
  }
}
