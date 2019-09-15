import 'package:flutter/material.dart';
import './pages/page_tab.dart';

void main() => runApp(
      MaterialApp(
        title: 'Index Route Page',
        home: IndexRoutesPage(),
      ),
    );

class IndexRoutesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Index Routes'),
      ),
      body: Container(
          child: Card(
        // child: ListView.builder(
        //   itemCount: 1,
        //   itemBuilder: (a, b) => ListTile(
        //     title: Text(
        //       'abc',
        //       textDirection: TextDirection.ltr,
        //     ),
        //     onTap: () {
        //       print('123');
        //     },
        //   ),
        // ),

        // 暂时先写死
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                '底部导航栏',
              ),
              subtitle: Text('底部导航栏示例'),
              leading: Icon(Icons.tab),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PageTab()
                ),);
                print('123');
              },
              // selected: true,
            ),
            Divider()
          ],
        ),
      )),
    );
  }
}
