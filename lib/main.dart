import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/index_route/index_route.dart';
import 'package:hello_flutter/pages/page_splash_screen/page_splash_screen.dart';

void main() => runApp(
      MaterialApp(
        title: 'Index Route Page',
        // home: IndexRoutesPage(),
        home: SplashScreen(),
        theme: ThemeData.dark(),
        // 去除debug的图标
        debugShowCheckedModeBanner: false,
      ),
    );
