import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class PageDio extends StatefulWidget {
  @override
  _PageDioState createState() => _PageDioState();
}

class _PageDioState extends State<PageDio> {
  Dio _dio = Dio();
  static String jsonStr = '[{"name": "jack"}, {"name": "rose"}]';
  // List items = json.decode(jsonStr);
  // print(_PageDioState.items);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot);
            print('---------------------------');
            print(snapshot.connectionState);
            if (snapshot.connectionState == ConnectionState.done) {
              Response response = snapshot.data;
              print('--------------------------');
              print('response $response');

              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              return ListView(
                children: response.data
                    .map<Widget>((e) => ListTile(
                          title: Text(e['full_name']),
                        ))
                    .toList(),
              );
            }
            return CircularProgressIndicator();
          },
          future: _dio.get('https://api.github.com/orgs/flutterchina/repos'),
        ),
      ),
    );
  }
}
