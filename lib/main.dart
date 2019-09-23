import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/index_route/index_route.dart';
import 'package:hello_flutter/pages/page_splash_screen/page_splash_screen.dart';
import 'package:hello_flutter/pages/panel_examples/panel_examples.dart';

void main() => runApp(
      MaterialApp(
        title: 'Index Route Page',
        // home: IndexRoutesPage(),
        home: SplashScreen(),
        theme: ThemeData.dark(),
        // 去除debug的图标
        debugShowCheckedModeBanner: false,
        routes: {
          // 使用命名路由
          "/examples": (context) => PanelExamples()
        },
      ),
    );
