import 'package:flutter/material.dart';

/**
 * 关于Image缓存:
 * flutter对图片的最大缓存数量是1000, 最大缓存空间是100m
 */

class PageImage extends StatefulWidget {
  @override
  _PageImageState createState() => _PageImageState();
}

class _PageImageState extends State<PageImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('图片和icon'),
        ),
        body: Center(
          child: Column(
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
                height: 200,
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
              Icon(MyIcons.book)
            ],
          ),
        ));
  }
}

class MyIcons {
  static const IconData book = const IconData(
    0xe614,
    fontFamily: 'myIcon',
    matchTextDirection: true
  );
}
