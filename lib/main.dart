import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hello_flutter/common/global.dart';
import 'package:hello_flutter/i10n/localization_intl.dart';
import 'package:hello_flutter/pages/index_route/index_route.dart';
import 'package:hello_flutter/pages/page_splash_screen/page_splash_screen.dart';
import 'package:hello_flutter/pages/panel_examples/panel_examples.dart';
import 'package:hello_flutter/pages/panel_index/panel_index.dart';
import 'package:hello_flutter/routes/languate_route.dart';
import 'package:hello_flutter/routes/login_route.dart';
import 'package:hello_flutter/routes/theme_change_route.dart';
import 'package:hello_flutter/states/index.dart';
import 'package:provider/provider.dart';

void main() => Global.init().then(
      (e) => runApp(MyApp()),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // 使用provider挂载全局的数据
        ChangeNotifierProvider.value(
          value: ThemeModel(),
        ),
        ChangeNotifierProvider.value(
          value: UserModel(),
        ),
        ChangeNotifierProvider.value(
          value: LocaleModel(),
        ),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (context, themeModel, localModel, child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: themeModel.theme,
            ),
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
              "login": (context) => LoginRoute(),
              "themes": (context) => ThemeChangeRoute(),
              "language": (context) => LanguageRoute(),
            },
          );
        },
      ),
    );
  }
}
