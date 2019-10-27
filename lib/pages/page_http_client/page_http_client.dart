import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class PageHttpClient extends StatefulWidget {
  @override
  _PageHttpClientState createState() => _PageHttpClientState();
}

class _PageHttpClientState extends State<PageHttpClient> {
  String _responseData = '暂无请求内容';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpClient'),
      ),
      // body: Center(child: CustomHome,),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            // CustomHome,
            RaisedButton(
              onPressed: () async {
                setState(() {
                  _responseData = '正在请求中....';
                });
                try {
                  HttpClient httpClient = new HttpClient();

                  HttpClientRequest request = await httpClient.getUrl(
                    Uri.parse('https://www.baidu.com'),
                  );
                  request.headers.add('user-agent', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
                  print(request);
                  print('--------------------------');
                  HttpClientResponse response = await request.close();

                  print(response.headers);
                  setState(() async {
                  _responseData = await response.transform(utf8.decoder).join();
                  });
                  httpClient.close();
                } catch (e) {
                  setState(() {
                    _responseData = '请求失败';
                  });
                }
              },
              child: Text('点击请求百度'),
            ),
            Text(_responseData)
          ],
        ),
      ),
    );
  }
}
class CustomHome extends Widget {
  @override
  Element createElement() {
    return HomeView(this);
  }
}
class HomeView extends ComponentElement{
  HomeView(Widget widget) : super(widget);
  String text = "123456789";

  @override
  Widget build() {
    Color primary=Theme.of(this).primaryColor; //1
    return GestureDetector(
      child: Center(
        child: FlatButton(
          child: Text(text, style: TextStyle(color: primary),),
          onPressed: () {
            var t = text.split("")..shuffle();
            text = t.join();
            markNeedsBuild(); //点击后将该Element标记为dirty，Element将会rebuild
          },
        ),
      ),
    );
  }
}
