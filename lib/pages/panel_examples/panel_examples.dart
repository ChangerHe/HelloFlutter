import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/page_animation/page_animation.dart';
import 'package:hello_flutter/pages/page_bessel_curve/page_bessel_curve.dart';
import 'package:hello_flutter/pages/page_custom_scroll_view/page_custom_scroll_view.dart';
import 'package:hello_flutter/pages/page_custom_tab/page_custom_tab.dart';
import 'package:hello_flutter/pages/page_dio/page_dio.dart';
import 'package:hello_flutter/pages/page_event/page_event.dart';
import 'package:hello_flutter/pages/page_expand/page_expand.dart';
import 'package:hello_flutter/pages/page_filter/page_filter.dart';
import 'package:hello_flutter/pages/page_grid/page_grid.dart';
import 'package:hello_flutter/pages/page_hero/page_hero.dart';
import 'package:hello_flutter/pages/page_http_client/page_http_client.dart';
import 'package:hello_flutter/pages/page_image/page_image.dart';
import 'package:hello_flutter/pages/page_infinite_scroll/page_infinite_scroll.dart';
import 'package:hello_flutter/pages/page_inherited_widget/page_inherited_widget.dart';
import 'package:hello_flutter/pages/page_keep_tab_alive/page_keep_tab_alive.dart';
import 'package:hello_flutter/pages/page_lifecycle/page_lifecycle.dart';
import 'package:hello_flutter/pages/page_media_query/page_media_query.dart';
import 'package:hello_flutter/pages/page_muti_animation/page_muti_animation.dart';
import 'package:hello_flutter/pages/page_operate_file/page_operate_file.dart';
import 'package:hello_flutter/pages/page_search_bar/page_search_bar.dart';
import 'package:hello_flutter/pages/page_selector/page_selector.dart';
import 'package:hello_flutter/pages/page_tab/page_tab.dart';
import 'package:hello_flutter/pages/page_theme/page_theme.dart';
import 'package:hello_flutter/pages/route_animation/route_animation.dart';
import 'package:hello_flutter/pages/page_right_back/page_right_back.dart';
import 'package:hello_flutter/pages/page_text/page_text.dart';
import 'package:hello_flutter/pages/page_button/page_button.dart';

class PanelExamples extends StatelessWidget {
  final arguments;
  PanelExamples({this.arguments});
  @override
  Widget build(BuildContext context) {
    print(arguments);
    return Scaffold(
      body: Container(
        child: Card(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  '普通底部导航栏',
                ),
                subtitle: Text(arguments != null && arguments.id
                    ? '传入了个参数${arguments.id}'
                    : '底部导航栏示例'),
                leading: Icon(Icons.tab_unselected),
                onTap: () async {
                  try {
                    Future.delayed(Duration(seconds: 1))
                        .then((e) => Future.error("xxx"));
                  } catch (e) {
                    print(e);
                  }
                  var result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageTab('我是传入的标题'),
                      fullscreenDialog: true,
                    ),
                  );

                  print(result);
                },
                // selected: true,
              ),
              Divider(),
              ListTile(
                title: Text(
                  '自定义底部导航栏',
                ),
                subtitle: Text('底部导航栏示例'),
                leading: Icon(Icons.tab),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageCustomTab()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '路由动画',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.router),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RouteAnimationPage()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '滤镜效果',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.filter),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageFilter()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '切换时保持页面状态',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.local_hotel),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageKeepTabAlive(),
                        settings: RouteSettings()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '搜索条',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.search),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageSearchBar()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '媒体查询和流式布局',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.perm_media),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageMediaQuery()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '展开闭合组件',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.explore),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageExpand()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '贝塞尔曲线',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.border_horizontal),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageBesselCurve()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '安卓右滑返回',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.slideshow),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageRightBack()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '生命周期',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.local_post_office),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageLifecycle(
                        initValue: 5,
                      ),
                    ),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '文本和字体',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.text_rotate_up),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageText()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '按钮',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.radio_button_checked),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageButton()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '图片和icon',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.image),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageImage()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '单选和复选框',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.image),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageSelector()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '无限滚动',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.settings_brightness),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageInfiniteScroll()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '不规则Grid',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.grid_on),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageGrid()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '自定义scroll view',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.screen_lock_landscape),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageCustomScrollView()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '数据共享(InheritedWidget)',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.content_copy),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageInheritedWidget()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '更换主题',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.theaters),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageTheme()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '事件系统',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.theaters),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageEvent()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '动画',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.airline_seat_legroom_normal),
                onTap: () {
                  Navigator.push(
                    context,
                    FadeRoute(builder: (context) => PageAnimation()),
                    // PageRouteBuilder(
                    //   transitionDuration: Duration(microseconds: 500),
                    //   pageBuilder: (
                    //     BuildContext context,
                    //     Animation animation,
                    //     Animation secondaryAnimation,
                    //   ) {
                    //     return FadeTransition(
                    //       opacity: animation,
                    //       child: PageAnimation(),
                    //     );
                    //   },
                    // ),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Hero动画',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.theaters),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageHero()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '组合动画',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.threesixty),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageMutiAnimation()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '文件操作',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.file_upload),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageOperateFile())
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  '网络请求',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.network_cell),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageHttpClient())
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Dio',
                ),
                // subtitle: Text(''),
                leading: Icon(Icons.network_locked),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageDio())
                  );
                },
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

class FadeRoute extends PageRoute {
  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // return FadeTransition(
    //   opacity: animation,
    //   child: builder(context),
    // );

    if (isActive) {
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    } else {
      // TODO: 为什么使用padding
      //是返回，则不应用过渡动画
      return Padding(padding: EdgeInsets.zero);
    }
  }
}
