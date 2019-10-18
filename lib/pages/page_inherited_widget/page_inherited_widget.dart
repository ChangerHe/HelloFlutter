import 'package:flutter/material.dart';

class PageInheritedWidget extends StatefulWidget {
  @override
  _PageInheritedWidgetState createState() => _PageInheritedWidgetState();
}

class _PageInheritedWidgetState extends State<PageInheritedWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('inheritedWidget'),
      ),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: _TestWidget(),
              ),
              RaisedButton(
                child: Text('increment'),
                onPressed: () => setState(() => ++count),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  final int data;

  static ShareDataWidget of(BuildContext context) {
    // return context.inheritFromWidgetOfExactType(ShareDataWidget);
    // 当shareDataWidget发生变化时, 子组件将不会调用didChangeDependencies()
    return context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget;
  }

  @override
  bool updateShouldNotify(ShareDataWidget old) {
    return old.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).data.toString());
    // return Text('123');
  }

  // 每次依赖变化时, 这个生命周期会被调用
  // 但是需要注意的是, 当我们不使用我们定义的InheritedWidget中的数据时, 这个生命周期就不会被调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Dependencies change');
  }
}

// class InhertedWidgetTest
