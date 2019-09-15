import 'package:flutter/material.dart';

class CustomRouterFade extends PageRouteBuilder {
  final Widget widget;

  CustomRouterFade(this.widget)
      : super(
            // transitionDuration：设置动画持续的时间，建议再1和2之间。
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              // FadeTransition:渐隐渐现过渡效果，主要设置opactiy（透明度）属性，值是0.0-1.0
              return FadeTransition(
                opacity: Tween(
                  begin: 0.0,
                  end: 1.0,
                  // animate :动画的样式，一般使用动画曲线组件（CurvedAnimation）。
                ).animate(
                  CurvedAnimation(
                    parent: animation1,
                    // curve: 设置动画的节奏，也就是常说的曲线，Flutter准备了很多节奏，通过改变动画取消可以做出很多不同的效果。
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                child: child,
              );
            });
}

class CustomRouterScale extends PageRouteBuilder {
  final Widget widget;

  CustomRouterScale(this.widget)
      : super(
            // transitionDuration：设置动画持续的时间，建议再1和2之间。
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              // FadeTransition:渐隐渐现过渡效果，主要设置opactiy（透明度）属性，值是0.0-1.0
              return ScaleTransition(
                  scale: Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animation1,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                  child: child);
            });
}

class CustomRouterRotate extends PageRouteBuilder {
  final Widget widget;

  CustomRouterRotate(this.widget)
      : super(
            // transitionDuration：设置动画持续的时间，建议再1和2之间。
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              // FadeTransition:渐隐渐现过渡效果，主要设置opactiy（透明度）属性，值是0.0-1.0
              return RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animation1,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                  child: ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animation1,
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                    child: child,
                  ));
            });
}

class CustomRouterSlide extends PageRouteBuilder {
  final Widget widget;

  CustomRouterSlide(this.widget)
      : super(
            // transitionDuration：设置动画持续的时间，建议再1和2之间。
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              // FadeTransition:渐隐渐现过渡效果，主要设置opactiy（透明度）属性，值是0.0-1.0
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1.0, 0.0),
                  end: Offset(0.0, 0.0),
                ).animate(
                  CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                child: child,
              );
            });
}
