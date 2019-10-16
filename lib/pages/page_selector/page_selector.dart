import 'package:flutter/material.dart';

class PageSelector extends StatefulWidget {
  @override
  _PageSelectorState createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  bool _switchSelected = false;
  bool _checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('单选和复选框'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Switch(
              onChanged: (value) {
                print('$value value');
                setState(() {
                  _switchSelected = value;
                });
              },
              value: _switchSelected,
              activeColor: Colors.red,
            ),
            Checkbox(
              onChanged: (value) {
                print('$value value');
                setState(() {
                  _checkboxSelected = value;
                });
              },
              value: _checkboxSelected,
            )
          ],
        ),
      ),
    );
  }
}
