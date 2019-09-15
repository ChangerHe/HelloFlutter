import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/page_tab/airplay_screen.dart';
import 'package:hello_flutter/pages/page_tab/email_screen.dart';
import 'package:hello_flutter/pages/page_tab/home_screen.dart';
import 'package:hello_flutter/pages/page_tab/pages_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _activeColor = Colors.blue;
  final _inactiveColor = Colors.black;
  int _currentIndex = 0;
  List<Widget> list = List();
  // TODO: 为何使用addAll不行?
  // @override
  // void initialState() {
  //   list.addAll([
  //     TabHomeScreen(),
  //     TabEmailScreen(),
  //     TabPagesScreen(),
  //     TabAirPlayScreen()
  //   ]);

  //   super.initState();
  // }
  @override
  void initState() {
    list
      ..add(TabHomeScreen())
      ..add(TabEmailScreen())
      ..add(TabPagesScreen())
      ..add(TabAirPlayScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: _activeColor,
        unselectedItemColor: _inactiveColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              // 可以单独对元素设置颜色, 设置之后会覆盖之前统一设置的selectItemColor
              // color: _activeColor,
            ),
            title: Text(
              'Home',
              // 可以单独对元素设置颜色, 设置之后会覆盖之前统一设置的selectItemColor
              // style: TextStyle(color: _activeColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
            ),
            title: Text(
              'Email',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
            ),
            title: Text(
              'Pages',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
            ),
            title: Text(
              'airplay',
            ),
          ),
        ],
        // 通过currentIndex设置当前选择的index
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // BottomNavigationBarType有两个参数
        // 1. shifting: 默认参数, 设置后仅选择的内容会显示底部文字, 如果无选择, 则默认第一个
        // 2. fixed: 设置后, 所有tab的底部文字都会显示出来
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
