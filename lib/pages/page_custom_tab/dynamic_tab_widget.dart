import 'package:flutter/material.dart';

class DynamicTabWidget extends StatefulWidget {
  String title;
  DynamicTabWidget({this.title});
  @override
  _DynamicTabWidgetState createState() => _DynamicTabWidgetState();
}

class _DynamicTabWidgetState extends State<DynamicTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.title == null || widget.title == 'HOME' || widget.title == 'ASSIGNMENT' ? null : AppBar(title: Text(widget.title),),
      body: Center(child: Text(widget.title ?? '')),
    );
  }
}
