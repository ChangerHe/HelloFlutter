import 'package:flutter/material.dart';

/**
 * 关于Image缓存:
 * flutter对图片的最大缓存数量是1000, 最大缓存空间是100m
 */

class PageImage extends StatefulWidget {
  @override
  _PageImageState createState() => _PageImageState();
}

class _PageImageState extends State<PageImage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('图片和icon'),
          // leading: Builder(builder: (context) {
          //   return IconButton(
          //     icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
          //     onPressed: () {
          //       // 打开抽屉菜单
          //       Scaffold.of(context).openDrawer();
          //     },
          //   );
          // }),
          bottom: TabBar(
              //生成Tab菜单
              controller: _tabController,
              tabs: tabs.map((e) => Tab(text: e)).toList()),
          actions: <Widget>[
            UnconstrainedBox(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(Colors.white70),
                ),
              ),
            )
          ],
        ),
        // drawer: new MyDrawer(), //抽屉
        body: Center(
          child: ListView(
            children: <Widget>[
              Image(
                image: AssetImage("images/lake.jpg"),
                // 设置宽度不设置高度, 高度则会等比例进行缩放, 宽度同理
                width: 100.0,
              ),
              // 上面的等价于下面的静态调用方式
              Image.asset(
                "images/lake.jpg",
                width: 100.0,
              ),
              Image(
                image: NetworkImage(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                width: 100.0,
              ),
              // 上面的等价于下面的静态调用方式
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100.0,
                height: 50,
                fit: BoxFit.cover,
                color: Colors.blue,
                // 设置混合模式, 必须要和color一起使用
                colorBlendMode: BlendMode.lighten,
                repeat: ImageRepeat.repeatY,
              ),
              Text(
                "\uE90D",
                style: TextStyle(
                  // 如果需要使用图标字体, 需要设置文本的字体为MaterialIcons
                  fontFamily: "MaterialIcons",
                  fontSize: 50,
                  color: Colors.green,
                ),
              ),
              Icon(MyIcons.book),
              Wrap(
                spacing: 16.0, // 主轴(水平)方向间距
                runSpacing: 4.0, // 纵轴（垂直）方向间距
                alignment: WrapAlignment.center, //沿主轴方向居中
                children: <Widget>[
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('A')),
                    label: new Text('Hamon'),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('M')),
                    label: new Text('Laette'),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('H')),
                    label: new Text('Migan'),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('J')),
                    label: new Text('Laurens'),
                  ),
                ],
              ),
              Flow(
                delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
                children: <Widget>[
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.red,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.green,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.blue,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.yellow,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.brown,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.purple,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 60.0,
                      minHeight: 60.0,
                    ), //父
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 90.0,
                        minHeight: 20.0,
                      ), //子
                      child: redBox,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text('test'),
                    width: 90,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class MyIcons {
  static const IconData book =
      const IconData(0xe614, fontFamily: 'myIcon', matchTextDirection: true);
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "imgs/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
