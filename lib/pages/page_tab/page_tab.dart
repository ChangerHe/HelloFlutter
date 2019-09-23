import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/page_tab/bottom_navigation_widget.dart';

class PageTab extends StatelessWidget {
  PageTab(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      // body: Wrap(
      //   children: <Widget>[
      //     FlatButton(
      //       onPressed: () {
      //         Navigator.pop(context, '我是传递的返回值');
      //       },
      //       child: Icon(Icons.add),
      //     ),
      //     BottomNavigationWidget(),
      //   ],
      // ),
      body: BottomNavigationWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('floating action bottom');
          // Navigator.of(context).pushNamed("examples", arguments: "hi");
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
