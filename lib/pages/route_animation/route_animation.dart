import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/route_animation/first_animation_page.dart';

class RouteAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '路由动画',
      home: FirstAnimationPage(),
      theme: ThemeData(
        // 设置顶部导航的颜色为红色
        primarySwatch: Colors.blue,
      ),
    );
  }
}
