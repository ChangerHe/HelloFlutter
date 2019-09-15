import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/page_tab/bottom_navigation_widget.dart';

void main(List<String> args) {
  runApp(PageTab());
}

class PageTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab 测试'),
      ),
      body: MaterialApp(
        title: 'Tab 测试',
        home: BottomNavigationWidget(),
      ),
      
    );
  }
}
