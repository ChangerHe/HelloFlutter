import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/page_custom_tab/dynamic_tab_widget.dart';

class PageCustomTab extends StatefulWidget {
  @override
  _PageCustomTabState createState() => _PageCustomTabState();
  // _DynamicTabWidgetState createState() => _DynamicTabWidgetState();

}

class _PageCustomTabState extends State<PageCustomTab> {
  int _index = 0;
  List _bodyView = [
    DynamicTabWidget(
      title: 'HOME',
    ),
    DynamicTabWidget(
      title: 'ASSIGNMENT',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Tab 测试'),
      ),
      body: _bodyView[_index],
      // 设置一个浮动的按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DynamicTabWidget(
              title: 'New Page',
            ),
          ));
        },
        tooltip: '你点了我, 赔钱',
        child: Icon(Icons.add),
      ),
      // 设置浮动的按钮的位置
      // centerDocked: 会固定在底部, 即使有底部的tab, 也不会移动, 边上有白色的圈, 可以与底部bottom形成一个嵌入的效果
      // centerFloat: 如果底部有tab, 则会浮到tab上面来
      // ... 有比较多参数, 默认使用的是endFloat
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          // 设置主轴占用的多少空间, 在这里因为是tab, 所以强制是max, 因此无需设置
          // mainAxisSize: MainAxisSize.max,
          // 设置主轴的对齐方式, 默认是start, 横向顺序排列
          // 其他属性类似于flex布局, 此处使用spaceAround, 即两边平均分配
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.assessment),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
