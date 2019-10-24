import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PageOperateFile extends StatefulWidget {
  @override
  _PageOperateFileState createState() => _PageOperateFileState();
}

class _PageOperateFileState extends State<PageOperateFile> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    // setState(() async {
    //   _counter = await _readCounter();
    // });

    _readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  _incrementCounter() async {
    setState(() {
      _counter++;
    });

    await (await _getLocalFile()).writeAsString('$_counter');
  }

  _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    print(dir);
    return File('$dir/counter.txt');
  }

  _readCounter() async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      return -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文件操作'),
      ),
      body: Center(
        child: Text('点击了 $_counter 次'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
