import 'package:flutter/material.dart';

class PageEvent extends StatefulWidget {
  @override
  _PageEventState createState() => _PageEventState();
}

class _PageEventState extends State<PageEvent> {
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('事件系统'),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.blue)),
                ),
                onPointerDown: (event) => print("down0"),
              ),
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                  child: Center(child: Text("左上角200*100范围内非文本区域点击")),
                ),
                onPointerDown: (event) => print("down1"),
                behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
              ),
            ],
          ),
          Listener(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 300.0,
              height: 150.0,
              child: Text(_event?.toString() ?? "",
                  style: TextStyle(color: Colors.white)),
            ),
            onPointerDown: (PointerDownEvent event) =>
                setState(() => _event = event),
            onPointerMove: (PointerMoveEvent event) =>
                setState(() => _event = event),
            onPointerUp: (PointerUpEvent event) =>
                setState(() => _event = event),
          ),
        ],
      ),
    );
  }
}
