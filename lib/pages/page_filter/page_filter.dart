import 'package:flutter/material.dart';
import 'dart:ui'; //引入ui库，因为ImageFilter Widget在这个里边。

class PageFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('滤镜效果'),
        ),
        body: Stack(
          //重叠的Stack Widget，实现重贴
          children: <Widget>[
            ConstrainedBox(
                // BoxConstraints 盒约束
                // TODO: https://api.flutter.dev/flutter/rendering/BoxConstraints-class.html
                constraints: BoxConstraints.expand(), //限制条件，可扩展的。
                child: Image.asset(
                  'images/lake.jpg',
                  // 设置填充方式  fill 代表填满
                  fit: BoxFit.fill,
                )),
            Center(
              // 注: ClipRect 用于裁切成长方形, 如果有需要的时候, 可以使用以下的ClipRRect, 代表裁切为有圆角的长方形
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: BackdropFilter(
                  //背景滤镜器
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ), //图片模糊过滤，横向竖向都设置5.0
                  child: Opacity(
                    // 设置透明度
                    opacity: 0.5,
                    child: Container(
                      width: 300.0,
                      height: 200.0,
                      //盒子装饰器，进行装饰，设置颜色为白色
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'Hello World',
                          style:
                              Theme.of(context).textTheme.headline, //设置比较酷炫的字体
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
