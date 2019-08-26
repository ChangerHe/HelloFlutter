import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  // 因为在MyScaffold中使用到了Material的主题, 所以我们需要将MyScaffold继承于MaterialApp, 用以使用MaterialApp中的主题等
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new MyScaffold(),
  ));
}

class MyAppBar extends StatelessWidget {
  // 这是一个有状态的组件, 增加了一个状态值为title
  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为"final"

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 136.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      // 
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局（linear layout）
      // 创建水平方向的布局
      child: new Row(
        //列表项的类型是 <Widget>
        // 此处<Widget>是作为一个类型转换, 但是此处如果是Js来讲, 是不需要加额外类型转换的
        children: <Widget>[
          new IconButton(
            // Icons来自于material design, 如果需要的话需要在pubspec中配置use material design
            icon: new Icon(Icons.menu),
            // 长按此部分, 可以出现提示
            tooltip: 'Navigation menu',
            onPressed: null, // null 会禁用 button
          ),
          // Expanded expands its child to fill the available space.
          new Expanded(
            // 此处使用到了state中的title字段, 而title中的内容则是通过new AppBar传参进入得到的
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  // 这是一个无状态组件
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Material(
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example title',
              // 通过material的theme来设置title的样式
              style: Theme.of(context).textTheme.title,
            ),
          ),
          // Expanded属性设置后, 它会填充其他区块没有填充的剩余空间
          // 可以设置多个Expanded组件
          new Expanded(
            // Center 垂直水平居中
            child: new Center(
              child: new Text('Hello, world!'),
            ),
          ),
          new Expanded(
            child: new Text(
              'Hello, world!',
            ),
          )
        ],
      ),
    );
  }
}

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // final wordPair = WordPair.random();
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       theme: new ThemeData(
//         primaryColor: Colors.white
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Welcome to Flutter'),
//         ),
//         body: Center(
//           // child: Text(wordPair.asPascalCase),
//           child: new RandomWords(),
//         ),
//       ),
//     );
//   }
// }

// class RandomWords extends StatefulWidget {
//   @override
//   RandomWordsState createState() => RandomWordsState();
// }

// class RandomWordsState extends State<RandomWords> {
//   final _biggerFont = const TextStyle(fontSize: 18.0);
//   final _suggestions = <WordPair>[];
//   final _saved = new Set<WordPair>();

//   void _pushSaved() {
//     Navigator.of(context).push(
//       new MaterialPageRoute(
//         builder: (context) {
//           final tiles = _saved.map(
//             (pair) {
//               return new ListTile(
//                 title: new Text(pair.asCamelCase, style: _biggerFont)
//               );
//             },
//           );

//           final divided = ListTile.divideTiles(
//             context: context,
//             tiles: tiles
//           ).toList();

//           return new Scaffold(
//             appBar: new AppBar(
//               title: new Text('Saved Suggestions'),
//             ),
//             body: new ListView(children: divided),
//           );
//         }
//       )
//     );
//   }
//   @override
//   Widget build(BuildContext context) {

//     Widget _buildSuggestions() {
//       return new ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemBuilder: (context, i) {
//           if (i.isOdd) return new Divider();

//           final index = i ~/ 2;

//           if (index >= _suggestions.length) {
//             _suggestions.addAll(generateWordPairs().take(10));
//           }
//           return _buildRow(_suggestions[index]);
//         }, 
//       );
//     }

//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('startup name generator'),
//         actions: <Widget>[
//           new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
//         ],
//       ),
//       body: _buildSuggestions(),
//     );

// //    final wordPair = new WordPair.random();
// //    return new Text(wordPair.asPascalCase);
//   }

//   Widget _buildRow(WordPair pair) {
//     final alreadySaved = _saved.contains(pair);
//     return new ListTile(
//       title: new Text(pair.asPascalCase, style: _biggerFont),
//       trailing: new Icon(
//         alreadySaved? Icons.favorite : Icons.favorite_border,
//         color: alreadySaved ? Colors.red : null
//       ),
//       onTap: () {
//         setState(() {
//           if (alreadySaved) {
//             _saved.remove(pair);
//           } else {
//             _saved.add(pair);
//           }
//         });
//       }
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
