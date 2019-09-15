import 'package:flutter/material.dart';

class SecondAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text(
          'Second',
          style: TextStyle(fontSize: 36),
        ),
        backgroundColor: Colors.pinkAccent,
        leading: Container(),
        elevation: 0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
