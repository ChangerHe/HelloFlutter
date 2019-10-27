import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hello_flutter/common/global.dart';
import 'package:hello_flutter/i10n/localization_intl.dart';
import 'package:hello_flutter/pages/index_route/index_route.dart';
import 'package:hello_flutter/pages/page_splash_screen/page_splash_screen.dart';
import 'package:hello_flutter/pages/panel_examples/panel_examples.dart';
import 'package:hello_flutter/pages/panel_index/panel_index.dart';

void main() => Global.init().then(
      (e) => runApp(
        MaterialApp(
          title: 'Index Route Page',
          // home: IndexRoutesPage(),
          home: SplashScreen(),
//        theme: ThemeData.dark(),
          // 去除debug的图标
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            // 在此处额外设置一个本地化的delegate
            DemoLocalizationsDelegate()
          ],
          routes: {
            // "/": (context) => PanelIndex(),
            // 如果需要传参, 则在此处定义好入参的内容, 并传递到组件中
            "/examples": (context, {arguments}) {
              // TODO: arguments is null
              return PanelExamples(
                arguments: arguments,
              );
            },
          },
        ),
      ),
    );
