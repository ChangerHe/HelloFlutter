import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_flutter/i10n/localization_intl.dart';

import 'package:hello_flutter/pages/panel_cart/panel_cart.dart';
import 'package:hello_flutter/pages/panel_categories/panel_categories.dart';
import 'package:hello_flutter/pages/panel_examples/panel_examples.dart';
import 'package:hello_flutter/pages/panel_index/panel_index.dart';
import 'package:hello_flutter/pages/panel_member/panel_member.dart';

final List<BottomNavigationBarItem> bottomTabs = [
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.folder), title: Text('案例')),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), title: Text('分类')),
  BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
  BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled), title: Text('会员中心')),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
];

final List<String> tabTitles = ['案例', '分类', '购物车', '会员中心', '首页'];

class IndexRoutesPage extends StatefulWidget {
  _IndexRoutesPageState createState() => _IndexRoutesPageState();
}

class _IndexRoutesPageState extends State<IndexRoutesPage> {
  int _activeTab = 0;
  List<Widget> _pageList = List();
  var _activeColor = Colors.blueAccent;
  var _inactiveColor = Colors.grey;
  String _title = '';

  @override
  _IndexRoutesPageState() {
    _pageList
      ..addAll([
        PanelExamples(),
        PanelCategories(),
        PanelCart(),
        PanelMember(),
        PanelIndex(),
      ]);
    // _pageList..add(value)
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text(tabTitles[_activeTab]),
          title: Text(DemoLocalizations.of(context).title)
          // title: Builder(
          //   builder: (context) {
          //     return Text(DemoLocalizations.of(context).title);
          //   },
          // ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: _activeColor,
          unselectedItemColor: _inactiveColor,
          showUnselectedLabels: true,
          currentIndex: _activeTab,
          items: bottomTabs,
          onTap: (index) {
            setState(() {
              _activeTab = index;
            });
          },
        ),
        body: _pageList[_activeTab]);
  }
}
