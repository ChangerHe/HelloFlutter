import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/route_animation/custom_router.dart';
import 'package:hello_flutter/pages/route_animation/second_animation_page.dart';

class FirstAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'first',
          style: TextStyle(fontSize: 36),
        ),
        // 设置顶部导航条和下面部分的区分界限的阴影部分的大小, 如果为0, 则表示无阴影
        elevation: 0,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: <Widget>[
            MaterialButton(
              child: Row(
                children: <Widget>[
                  Text(
                    '渐变动画',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: 64,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => SecondAnimationPage())
                    // 在此处使用我们自定义的动画函数即可
                    CustomRouterFade(SecondAnimationPage()));
              },
            ),
            MaterialButton(
              child: Row(
                children: <Widget>[
                  Text(
                    '缩放动画',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: 64,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => SecondAnimationPage())
                    // 在此处使用我们自定义的动画函数即可
                    CustomRouterScale(SecondAnimationPage()));
              },
            ),
            MaterialButton(
              child: Row(
                children: <Widget>[
                  Text(
                    '旋转动画',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: 64,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => SecondAnimationPage())
                    // 在此处使用我们自定义的动画函数即可
                    CustomRouterRotate(SecondAnimationPage()));
              },
            ),
            MaterialButton(
              child: Row(
                children: <Widget>[
                  Text(
                    '滑动动画',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: 64,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => SecondAnimationPage())
                    // 在此处使用我们自定义的动画函数即可
                    CustomRouterSlide(SecondAnimationPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
