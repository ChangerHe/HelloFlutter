import 'package:flutter/material.dart';

class ThemeChangeRoute extends StatefulWidget {
  @override
  _ThemeChangeRouteState createState() => _ThemeChangeRouteState();
}

class _ThemeChangeRouteState extends State<ThemeChangeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ThemeChangeRoute'),
      ),
      body: Center(
        child: Text('ThemeChangeRoute'),
      ),
    );
  }
}