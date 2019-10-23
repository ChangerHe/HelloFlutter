import 'package:flutter/material.dart';

class PageHero extends StatelessWidget {
  Widget build(BuildContext context) {
    var timeDilation = 5.0; // 1.0 means normal animation speed.

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: new Center(
        child: new PhotoHero(
          photo: 'images/lake.jpg',
          width: 300.0,
          onTap: () {
            Navigator.of(context).push(
                new MaterialPageRoute<Null>(builder: (BuildContext context) {
              return new Scaffold(
                  appBar: new AppBar(
                    title: const Text('Flippers Page'),
                  ),
                  body: Column(
                    children: <Widget>[
                      Container(
                        // The blue background emphasizes that it's a new route.
                        color: Colors.lightBlueAccent,
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.topLeft,
                        child: new PhotoHero(
                          photo: 'images/lake.jpg',
                          width: 100.0,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      // 这是一个拥有点击背景动画的组件
                      InkWell(
                        child: ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 200, minWidth: 200),
                            child: Text('123')),
                        onTap: () {
                          print('111');
                        },
                      ),
                    ],
                  ));
            }));
          },
        ),
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return new SizedBox(
      width: width,
      child: new Hero(
        // 这里的核心在于这个photo, photo既作为tag来表示hero的唯一表示, 又用作显示图片的地址
        tag: photo,
        child: Listener(
          child: Container(
            child: new Material(
              color: Colors.transparent,
              child: Image.asset(
                photo,
                fit: BoxFit.contain,
              ),
            ),
          ),
          onPointerDown: (event) {
            return onTap();
          },
        ),
      ),
    );
  }
}
