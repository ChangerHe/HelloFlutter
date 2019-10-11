import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/page_bessel_curve/page_bessel_curve.dart';
import 'package:hello_flutter/pages/page_custom_tab/page_custom_tab.dart';
import 'package:hello_flutter/pages/page_expand/page_expand.dart';
import 'package:hello_flutter/pages/page_filter/page_filter.dart';
import 'package:hello_flutter/pages/page_keep_tab_alive/page_keep_tab_alive.dart';
import 'package:hello_flutter/pages/page_media_query/page_media_query.dart';
import 'package:hello_flutter/pages/page_search_bar/page_search_bar.dart';
import 'package:hello_flutter/pages/page_tab/page_tab.dart';
import 'package:hello_flutter/pages/route_animation/route_animation.dart';
import 'package:hello_flutter/pages/page_right_back/page_right_back.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}