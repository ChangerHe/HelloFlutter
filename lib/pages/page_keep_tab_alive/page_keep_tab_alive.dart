import 'package:flutter/material.dart';

class PageKeepTabAlive extends StatefulWidget {
  @override
  _PageKeepTabAliveState createState() => _PageKeepTabAliveState();
}

// TODO: SingleTickerProviderStateMixin是什么
class _PageKeepTabAliveState extends State<PageKeepTabAlive>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    // TODO: 为何_controller必须在initState中定义?
    _controller = TabController(length: 3, vsync: this);
  }

  //重写被释放的方法，只释放TabController
  // TODO: dispose是什么
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mixin'),
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          Center(
            child: Text(
              '当前Counter值是$_counter',
              style: TextStyle(fontSize: 32),
            ),
          ),
          Center(
            child: Text(
              '当前Counter值是$_counter',
              style: TextStyle(fontSize: 32),
            ),
          ),
          Center(
            child: Text(
              '当前Counter值是$_counter',
              style: TextStyle(fontSize: 32),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
