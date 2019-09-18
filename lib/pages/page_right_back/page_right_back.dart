import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'right_back_inner_page.dart';

class PageRightBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoButton(
          child:
              Text('', style: TextStyle(color: CupertinoColors.activeBlue)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          color: CupertinoColors.activeBlue,
          child: CupertinoButton(
              child: Center(
                // TODO: 如何居中?
                child: Text(
                  '老板点我',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => RightBackInnerPage()));
              }),
        ),
      ),
    );
  }
}
