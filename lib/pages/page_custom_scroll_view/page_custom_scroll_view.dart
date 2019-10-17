import 'package:flutter/material.dart';
import 'dart:async';

class PageCustomScrollView extends StatefulWidget {
  @override
  _PageCustomScrollViewState createState() => _PageCustomScrollViewState();
}

class _PageCustomScrollViewState extends State<PageCustomScrollView> {
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          //List
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
    );
  }
}
