import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/route_animation/first_animation_page.dart';

class RouteAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由动画'),
        elevation: 0,
      ),
      body: FirstAnimationPage(),
      // MaterialApp 可用, 设置主题
      // theme: ThemeData(
      //   // 设置顶部导航的颜色为红色
      //   primarySwatch: Colors.blue,
      // ),
    );
  }
}
