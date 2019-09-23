import 'package:flutter/material.dart';

class TabHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('HOME'),
      // ),
      body: Center(
        child: FlatButton(
          child: Icon(Icons.flip_to_back),
          onPressed: () {
            Navigator.pop(context, '我是返回值');
          },
        ),
      ),
    );
  }
}
