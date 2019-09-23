import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/index_route/index_route.dart';
import 'package:hello_flutter/pages/page_splash_screen/page_splash_screen.dart';
import 'package:hello_flutter/pages/panel_examples/panel_examples.dart';
import 'package:hello_flutter/pages/panel_index/panel_index.dart';

void main() => runApp(
      MaterialApp(
        title: 'Index Route Page',
        // home: IndexRoutesPage(),
        home: SplashScreen(),
        theme: ThemeData.dark(),
        // 去除debug的图标
        debugShowCheckedModeBanner: false,
        routes: {
          // "/": (context) => PanelIndex(),
          // 如果需要传参, 则在此处定义好入参的内容, 并传递到组件中
          "/examples": (context, {arguments}) {
            // TODO: arguments is null
            return PanelExamples(arguments: arguments,);
          },
        },
        // initialRoute: '/',
        // onGenerateRoute: (settings) {
        //   final String name = settings.name;
        //   final arguments = settings.arguments;
        //   final Function pageContentBuilder = routes[name];

        //   if (pageContentBuilder != null) {
        //     if (settings.arguments != null) {
        //       final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context, arguments: settings.arguments),);
        //       return route;
        //     } else {
        //       final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
        //       return route;
        //     }
        //   }
        // },
      ),
    );
