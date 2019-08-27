/**
 * -----------------------------------------------------
 * widget demo
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        // Change to buildColumn() for the other column example
        body: buildRow(),
      ),
    );
  }

  Widget buildRow() =>
      // #docregion Row
      Row(
        mainAxisAlignment: MainAxisAlignment.center,

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('images/lake.jpg', width: 100,),
          Image.asset('images/lake.jpg', width: 100),
          Image.asset('images/lake.jpg', width: 100),
          Image.network('https://flutter.dev/assets/ui/layout/pavlova-large-annotated-05a910e84242ba5185fe735515cb3f794640f49493036631ec99f768dce107c6.png')
        ],
      );
  // #enddocregion Row

  Widget buildColumn() =>
      // #docregion Column
      Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 2, child: Image.asset('images/lake.jpg')),
          Expanded(child: Image.asset('images/lake.jpg'),),
          Expanded(child: Image.asset('images/lake.jpg'),),
          
          // Image.asset('images/lake.jpg', width: 100),
          // Image.asset('images/lake.jpg', width: 100),
        ],
        
      );

}

final stars = Row(
  mainAxisSize: MainAxisSize.max,
  children: [
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.black),
    Icon(Icons.star, color: Colors.black),
  ],
);

final ratings = Container(
  padding: EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      stars
    ],
  ),
);

final descTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w800,
  fontFamily: 'Roboto',
  letterSpacing: 0.5,
  fontSize: 18,
  height: 2,
);

// DefaultTextStyle.merge() allows you to create a default text
// style that is inherited by its child and all subsequent children.
final iconList = DefaultTextStyle.merge(
  style: descTextStyle,
  child: Container(
    padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.kitchen, color: Colors.green[500]),
            Text('PREP:'),
            Text('25 min'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.timer, color: Colors.green[500]),
            Text('COOK:'),
            Text('1 hr'),
          ],
        ),
        Column(
          children: [
            Icon(Icons.restaurant, color: Colors.green[500]),
            Text('FEEDS:'),
            Text('4-6'),
          ],
        ),
      ],
    ),
  ),
);

/**
 * -----------------------------------------------------
 * todo list demo
 */

// import 'package:flutter/material.dart';

// void main() {
//   runApp(new MaterialApp(
//     title: 'Shopping App',
//     home: new ShoppingList(
//       products: <Product>[
//         new Product(name: 'Eggs'),
//         new Product(name: 'Flour'),
//         new Product(name: 'Chocolate chips'),
//       ],
//     ),
//   ));
// }

// class Product {
//   const Product({this.name});
//   final String name;
// }

// typedef void CartChangedCallback(Product product, bool inCart);

// class ShoppingListItem extends StatelessWidget {
//   ShoppingListItem({
//     Product product,
//     this.inCart,
//     this.onCartChanged
//   }) : product = product, super(key: new ObjectKey(product));
//   // 是无状态的。它将其在构造函​​数中接收到的值存储在final成员变量中，然后在build函数中使用它们
//   final Product product;
//   final bool inCart;
//   final CartChangedCallback onCartChanged;

//   // 获取颜色的函数
//   Color _getColor(BuildContext context) {
//     return inCart ? Colors.black54 : Theme.of(context).primaryColor;
//   }

//   TextStyle _getTextStyle(BuildContext context) {
//     if (!inCart) return null;

//     return new TextStyle(
//       color: Colors.black54,
//       decoration: TextDecoration.lineThrough
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new ListTile(
//       onTap: () {
//         onCartChanged(product, !inCart);
//       },
//       leading: new CircleAvatar(
//         backgroundColor: inCart ? Colors.black54 : Theme.of(context).primaryColor,
//         child: new Text(product.name[0]),
//       ),
//       title: new Text(product.name, style: _getTextStyle(context))
//     );
//   }
// }
// class ShoppingList extends StatefulWidget {
//   ShoppingList({Key key, this.products}) : super(key: key);

//   final List<Product> products;

//   // The framework calls createState the first time a widget appears at a given
//   // location in the tree. If the parent rebuilds and uses the same type of
//   // widget (with the same key), the framework will re-use the State object
//   // instead of creating a new State object.

//   @override
//   _ShoppingListState createState() => new _ShoppingListState();
// }

// class _ShoppingListState extends State<ShoppingList> {
//   Set<Product> _shoppingCart = new Set<Product>();

//   void _handleCartChanged(Product product, bool inCart) {
//     setState(() {
//       // When user changes what is in the cart, we need to change _shoppingCart
//       // inside a setState call to trigger a rebuild. The framework then calls
//       // build, below, which updates the visual appearance of the app.

//       if (inCart)
//         _shoppingCart.add(product);
//       else
//         _shoppingCart.remove(product);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('Shopping List'),
//       ),
//       body: new ListView(
//         padding: new EdgeInsets.symmetric(vertical: 8.0),
//         children: widget.products.map((Product product) {
//           return new ShoppingListItem(
//             product: product,
//             inCart: _shoppingCart.contains(product),
//             onCartChanged: _handleCartChanged,
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

/**
 * -----------------------------------------------------
 * count demo
 */

// import 'package:flutter/material.dart';

// void main() {
//   runApp(new MaterialApp(
//     title: 'Flutter Tutorial',
//     home: new TutorialHome(),
//   ));
// }

// class TutorialHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //Scaffold是Material中主要的布局组件.
//     return new Scaffold(
//       appBar: new AppBar(
//         leading: new IconButton(
//           icon: new Icon(Icons.menu),
//           tooltip: 'Navigation menu',
//           onPressed: null,
//         ),
//         title: new Text('Example title'),
//         actions: <Widget>[
//           new IconButton(
//             icon: new Icon(Icons.search),
//             tooltip: 'Search',
//             onPressed: null,
//           ),
//         ],
//       ),
//       //body占屏幕的大部分
//       body: new Center(
//         // child: MyButton(),
//         child: Counter(),
//       ),
//       floatingActionButton: new FloatingActionButton(
//         tooltip: 'Add', // used by assistive technologies
//         child: new Icon(Icons.add),
//         onPressed: null,
//       ),
//     );
//   }
// }

// class MyButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new GestureDetector(
//       onTap: () {
//         print('MyButton was tapped!');
//       },
//       child: new Container(
//         height: 36.0,
//         padding: const EdgeInsets.all(8.0),
//         margin: const EdgeInsets.symmetric(horizontal: 8.0),
//         decoration: new BoxDecoration(
//           borderRadius: new BorderRadius.circular(5.0),
//           color: Colors.lightGreen[500],
//         ),
//         child: new Center(
//           child: new Text('Engage'),
//         ),
//       ),
//     );
//   }
// }

// class CounterDisplay extends StatelessWidget {
//   CounterDisplay({this.count});

//   final int count;

//   @override
//   Widget build(BuildContext context) {
//     return new Text('Count: $count');
//   }
// }

// class CounterIncrementor extends StatelessWidget {
//   CounterIncrementor({this.onPressed});

//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return new RaisedButton(
//       onPressed: onPressed,
//       child: new Text('Increment'),
//     );
//   }
// }

// class Counter extends StatefulWidget {
//   @override
//   _CounterState createState() => new _CounterState();
// }

// class _CounterState extends State<Counter> {
//   int _counter = 0;

//   void _increment() {
//     print('pressed');
//     setState(() {
//       ++_counter;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Row(children: <Widget>[
//       new CounterIncrementor(onPressed: _increment),
//       new CounterDisplay(count: _counter),
//     ]);
//   }
// }

// class Counter extends StatefulWidget {
//   // This class is the configuration for the state. It holds the
//   // values (in this nothing) provided by the parent and used by the build
//   // method of the State. Fields in a Widget subclass are always marked "final".

//   @override
//   _CounterState createState() => new _CounterState();
// }

// class _CounterState extends State<Counter> {
//   int _counter = 0;

//   void _increment() {
//     setState(() {
//       // This call to setState tells the Flutter framework that
//       // something has changed in this State, which causes it to rerun
//       // the build method below so that the display can reflect the
//       // updated values. If we changed _counter without calling
//       // setState(), then the build method would not be called again,
//       // and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance
//     // as done by the _increment method above.
//     // The Flutter framework has been optimized to make rerunning
//     // build methods fast, so that you can just rebuild anything that
//     // needs updating rather than having to individually change
//     // instances of widgets.
//     return new Row(
//       children: <Widget>[
//         new RaisedButton(
//           onPressed: _increment,
//           child: new Text('Increment $_counter'),
//         ),
//         new Text('Count: $_counter'),
//       ],
//     );
//   }
// }

/**
 * -----------------------------------------------------
 * 关于widget
 */

// import 'package:flutter/material.dart';

// void main() {
//   // 因为在MyScaffold中使用到了Material的主题, 所以我们需要将MyScaffold继承于MaterialApp, 用以使用MaterialApp中的主题等
//   runApp(new MaterialApp(
//     title: 'My app', // used by the OS task switcher
//     home: new MyScaffold(),
//   ));
// }

// class MyAppBar extends StatelessWidget {
//   // 这是一个有状态的组件, 增加了一个状态值为title
//   MyAppBar({this.title});

//   // Widget子类中的字段往往都会定义为"final"

//   final Widget title;

//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       height: 136.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
//       //
//       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       decoration: new BoxDecoration(color: Colors.blue[500]),
//       // Row 是水平方向的线性布局（linear layout）
//       // 创建水平方向的布局
//       child: new Row(
//         //列表项的类型是 <Widget>
//         // 此处<Widget>是作为一个类型转换, 但是此处如果是Js来讲, 是不需要加额外类型转换的
//         children: <Widget>[
//           new IconButton(
//             // Icons来自于material design, 如果需要的话需要在pubspec中配置use material design
//             icon: new Icon(Icons.menu),
//             // 长按此部分, 可以出现提示
//             tooltip: 'Navigation menu',
//             onPressed: null, // null 会禁用 button
//           ),
//           // Expanded expands its child to fill the available space.
//           new Expanded(
//             // 此处使用到了state中的title字段, 而title中的内容则是通过new AppBar传参进入得到的
//             child: title,
//           ),
//           new IconButton(
//             icon: new Icon(Icons.search),
//             tooltip: 'Search',
//             onPressed: null,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyScaffold extends StatelessWidget {
//   // 这是一个无状态组件
//   @override
//   Widget build(BuildContext context) {
//     // Material 是UI呈现的“一张纸”
//     return new Material(
//       // Column is 垂直方向的线性布局.
//       child: new Column(
//         children: <Widget>[
//           new MyAppBar(
//             title: new Text(
//               'Example title',
//               // 通过material的theme来设置title的样式
//               style: Theme.of(context).textTheme.title,
//             ),
//           ),
//           // Expanded属性设置后, 它会填充其他区块没有填充的剩余空间
//           // 可以设置多个Expanded组件
//           new Expanded(
//             // Center 垂直水平居中
//             child: new Center(
//               child: new Text('Hello, world!'),
//             ),
//           ),
//           new Expanded(
//             child: new Text(
//               'Hello, world!',
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

/**
 * -----------------------------------------------------
 * hello world 和包的使用
 */

// import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';

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
