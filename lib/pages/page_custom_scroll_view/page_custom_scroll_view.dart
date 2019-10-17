import 'package:flutter/material.dart';
import 'dart:async';

class PageCustomScrollView extends StatefulWidget {
  @override
  _PageCustomScrollViewState createState() => _PageCustomScrollViewState();
}

class _PageCustomScrollViewState extends State<PageCustomScrollView> {
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false;
  DateTime _lastPressedAt;
  var timer;

  @override
  void initState() {
    _controller.addListener(() {
      // print('$_controller ${_controller.offset}');
      throttle(() {
        print(this.timer);
        if (_controller.offset < 1000) {
          setState(() {
            showToTopBtn = false;
          });
        } else {
          setState(() {
            showToTopBtn = true;
          });
        }
      }, 40);
    });

    // this._showDialog();
  }

  @override
  void dispose() {
    if (this.timer != null) {
      this.timer.cancel();
    }
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  void throttle(callback, time) {
    final throttleTime = Duration(milliseconds: time);
    if (this.timer != null) {
      this.timer.cancel();
    }
    this.timer = Timer(throttleTime, callback);
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                // 需要回退两层, 第一层是dialog的蒙层
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('$_lastPressedAt');
        _showDialog();
        if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return Future(() => false);
          }
          return Future(() => true);

      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('自定义scroll view'),
        // ),
        floatingActionButton: showToTopBtn
            ? FloatingActionButton(
                child: Center(
                  child: Icon(Icons.arrow_downward),
                ),
                onPressed: () {},
              )
            : null,
        body: CustomScrollView(
          controller: _controller,
          slivers: <Widget>[
            //AppBar，包含一个导航栏
            SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Demo'),
                background: Image.asset(
                  "./images/lake.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: new SliverGrid(
                //Grid
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //Grid按两列显示
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0,
                ),
                delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    //创建子widget
                    return new Container(
                      alignment: Alignment.center,
                      color: Colors.cyan[100 * (index % 9)],
                      child: new Text('grid item $index'),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ),
            new SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                //创建列表项
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: new Text('list item $index'),
                );
              }, childCount: 50 //50个列表项
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
