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
    // 在初始化状态时, 将传入的initValue作为_counter的起始参数
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
//                    此处演示在widget树中获取state：
//                    1. 通过context对象来获取
//                   查找父级最近的Scaffold对应的ScaffoldState对象
//                    ScaffoldState _state = context
//                        .ancestorStateOfType(TypeMatcher<ScaffoldState>());
//                    print('$_state state');
//                    //调用ScaffoldState的showSnackBar来弹出SnackBar
//                    _state.showSnackBar(
//                      SnackBar(
//                        content: Text("我是SnackBar"),
//                      ),
//                    );

//                  2. 直接使用Scaffold.of来获取
//                  其实是上面的方法的封装
//                  但是对于Flutter规范来说
//                  如果允许访问State， 则建议在StatefulWidget中实现一个静态的of方法
                    ScaffoldState _state = Scaffold.of(context);
                    _state.showSnackBar(
                      SnackBar(
                        content: Text("我是SnackBar"),
                      ),
                    );

//                  3. 通过GlobalKey
//                  Globalkey
//                    _drawerKey.currentState.openDrawer()
                  },
                  child: Text("显示SnackBar"),
                );
              },
            ),
            TapboxA(),
            ParentWidget(),
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

// 组件内部管理状态示例
class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

// 使用父组件保存状态示例
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {

  void parendOnChanged(active) {
    print('$active active');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: TapboxB(onChanged: null, active: false,),
    );
  }
}

class TapboxB extends StatelessWidget {
  TapboxB({
    Key key,
    this.active: false,
    @required this.onChanged,
}): super(key: key);

  final bool active;
  final onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Container(
          child: Text(active ? 'abc' : 'def'),
          width: 100,
          height: 100,
          decoration: BoxDecoration(color: active ? Colors.blueAccent : Colors.black38),
        ),
        onTap: () {
          onChanged(!active);
        },
      ),
    );
  }
}
