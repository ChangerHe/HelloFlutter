import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

/**
 * final 和 const
 * 核心区别在于: 一个是运行时常量, 一个是编译时常量
 * 
 * 1. final修饰的对象常量, 内部可以修改, const无法修改
 * 2. const声明的内容只会被声明一次, 也就是说相同的const对象不会被重复创建
 * 3. const无法修饰一个运行时常量如DateTime.now(), 但是final可以
 */

class PageInfiniteScroll extends StatefulWidget {
  @override
  _PageInfiniteScrollState createState() => _PageInfiniteScrollState();
}

class _PageInfiniteScrollState extends State<PageInfiniteScroll> {
  static const loadingTag = "##loading##"; //表尾标记
  List<String> _words = [loadingTag];
  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final list0 = [1, 2, 3];
    // 正确, final修饰的常量内部可修改
    list0[0] = 4;
    const list1 = [1, 2, 3];
    // 错误 const不能修饰一个运行时常量, 只能修饰编译时常量
    // const time = DateTime.now();
    final time = DateTime.now();
    // 错误, const修饰的常量内部无法修改
    // list1[0] = 4;
    List getConst() => const [1, 2];
    List getList() => [1, 2];
    List const1 = getConst();
    List const2 = getConst();
    List list3 = getList();
    List list4 = getList();
    // 相同的const变量不会在内存中重复创建
    print('${const1 == const2}'); // true
    print(identical(const1, const2)); // true
    print('${list4 == list3}'); // false
    print(identical(list3, list4)); // false
    // print('$list0 $list1');
    return Scaffold(
      appBar: AppBar(
        title: Text('无限滚动'),
      ),
      // ListView.separated可以在生成的列表项之间添加一个分割组件
      // 它比ListView.builder多了一个separatorBuilder参数，该参数是一个分割组件生成器。
      body: ListView.separated(
        itemCount: _words.length,
        itemBuilder: (context, index) {
          //如果到了表尾
          if (_words[index] == loadingTag) {
            //不足100条，继续获取数据
            if (_words.length - 1 < 100) {
              //获取数据
              _retrieveData();
              //加载时显示loading
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0)),
              );
            } else {
              //已经加载了100条数据，不再获取数据。
              return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey),
                  ));
            }
          }
          //显示单词列表项
          return ListTile(title: Text(_words[index]));
        },
        separatorBuilder: (context, index) => Divider(height: .0),
      ),
    );
  }
}
