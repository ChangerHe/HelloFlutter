import 'package:flutter/material.dart';

class PageTheme extends StatefulWidget {
  @override
  _PageThemeState createState() => new _PageThemeState();
}

class _PageThemeState extends State<PageTheme> {
  Color _themeColor = Colors.teal; //当前路由主题色

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
          iconTheme: IconThemeData(color: _themeColor) //用于Icon颜色
          ),
      child: Scaffold(
        appBar: AppBar(title: Text("主题测试")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //第一行Icon使用主题中的iconTheme
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Icon(Icons.airport_shuttle),
              Text("  颜色跟随主题")
            ]),
            //为第二行Icon自定义颜色（固定为黑色)
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("  颜色固定黑色")
                  ]),
            ),
            StreamBuilder<int>(
              stream: counter(), //
              //initialData: ,// a Stream<int> or null
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('没有Stream');
                  case ConnectionState.waiting:
                    return Text('等待数据...');
                  case ConnectionState.active:
                    return Text('active: ${snapshot.data}');
                  case ConnectionState.done:
                    return Text('Stream已关闭');
                }
                return null; // unreachable
              },
            ),
            FlatButton(
              child: Text('显示确认框'),
              onPressed: () async {
                var backValue = await _showAlert();
                print('返回值 $backValue');
              },
            ),
            FlatButton(
              child: Text('显示选择框'),
              onPressed: () async {
                int selectNum = await _showSingleDialog();
                print("选择了：${selectNum == 1 ? "中文简体" : "美国英语"}");
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => //切换主题
                setState(() => _themeColor =
                    _themeColor == Colors.teal ? Colors.blue : Colors.teal),
            child: Icon(Icons.palette)),
      ),
    );
  }

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }

  _showAlert() {
    print(1);
    return showDialog(
      context: context,
      builder: (context) {
        bool _withTree = false;
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  // //使用StatefulBuilder来构建StatefulWidget上下文
                  // StatefulBuilder(
                  //   builder: (context, _setState) {
                  //     return Checkbox(
                  //       value: _withTree, //默认不选中
                  //       onChanged: (bool value) {
                  //         //_setState方法实际就是该StatefulWidget的setState方法，
                  //         //调用后builder方法会重新被调用
                  //         _setState(() {
                  //           //更新选中状态
                  //           _withTree = !_withTree;
                  //         });
                  //       },
                  //     );
                  //   },
                  // ),

                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: _withTree,
                        onChanged: (bool value) {
                          (context as Element).markNeedsBuild();
                          _withTree = !_withTree;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), //关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // ... 执行删除操作
                Navigator.of(context).pop(_withTree); //关闭对话框
              },
            ),
          ],
        );

        // return Dialog(
        //   child: Column(
        //     children: <Widget>[
        //       ListTile(title: Text("请选择")),
        //       Expanded(
        //           child: ListView.builder(
        //         itemCount: 30,
        //         itemBuilder: (BuildContext context, int index) {
        //           return ListTile(
        //             title: Text("$index"),
        //             onTap: () => Navigator.of(context).pop(index),
        //           );
        //         },
        //       )),
        //     ],
        //   ),
        // );
      },
    );
  }

  _showSingleDialog() async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    return i;
  }
}
