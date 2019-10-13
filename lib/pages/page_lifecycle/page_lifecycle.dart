import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/page_tab/page_tab.dart';

// 生命周期状态
// 进入时: 初始化状态 > 加载相关的依赖 > 构建和渲染
// initState > didChangeDependencies > build
// 退出当前页面栈时
// deactivate > dispose
// 进入到下一个页面时(从下一个页面返回时):
// deactivate > build
// 热重载时
// reassemble > didUpdateWidget > build

// 组件接受一个initValue参数, 代表组件的初始值
class PageLifecycle extends StatefulWidget {
  const PageLifecycle({Key key, this.initValue: 0});

  final initValue;

  @override
  _PageLifecycleState createState() => _PageLifecycleState();
}

class _PageLifecycleState extends State<PageLifecycle> {
  int _counter;

  // 初始化： 当Widget 第一次插入到Widget树中时被调用
  @override
  void initState() {
    super.initState();
    // 在初始化状态时, 将传入的initvalue作为_counter的起始参数
    _counter = widget.initValue;
    print('initState');
  }

  // 构建Widget子树
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('生命周期'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                setState(() {
                  _counter = _counter + 3;
//                  ++_counter;
                });
              },
              child: Text(
                '${_counter}',
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageTab('from lifecycle page'),
                  ),
                );
              },
              child: Text('material button'),
            ),
            Builder(
              builder: (context) {
                return RaisedButton(
                  onPressed: () {
                    // 此处演示在widget树中获取state：通过context对象来获取
                    // 查找父级最近的Scaffold对应的ScaffoldState对象
                    ScaffoldState _state = context
                        .ancestorStateOfType(TypeMatcher<ScaffoldState>());
                    print('$_state state');
                    //调用ScaffoldState的showSnackBar来弹出SnackBar
                    _state.showSnackBar(
                      SnackBar(
                        content: Text("我是SnackBar"),
                      ),
                    );
                  },
                  child: Text("显示SnackBar"),
                );
              },
            )
          ],
        ),
      ),
    );
  }

//  Widget重新构建时调用
  @override
  void didUpdateWidget(PageLifecycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  // 禁用
  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  // 销毁
  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

//  只是提供给在开发者模式下调用的， 热重载的时候调用
  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }

  // 改变依赖： state对象的依赖发生变化时调用
//  典型的场景是当系统语言Locale或应用主题改变时，Flutter framework会通知widget调用此回调。
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}
