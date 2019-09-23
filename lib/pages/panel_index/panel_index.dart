import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/panel_examples/panel_examples.dart';

class PanelIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ButtonBar(
          children: <Widget>[
            DropdownButton(
              items: [
                DropdownMenuItem(
                  value: '123',
                  child: Text('123'),
                ),
                DropdownMenuItem(
                  value: '456',
                  child: Text('456'),
                ),
              ],
              onChanged: (String arg) {
                print(arg);
              },
            ),
            Text('456'),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/examples");
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PanelExamples(),
                //   ),
                // );
              },
              child: Icon(Icons.adb),
            ),
            // Stack(
            //   children: <Widget>[
            //     Positioned(
            //       child: FloatingActionButton(
            //         child: Icon(Icons.add),
            //         onPressed: () {
            //           print('231');
            //         },
            //       ),
            //       right: 0,
            //       bottom: 0,
            //     ),
            //   ],
            // ),
          ],
        )
      ],
    );
  }
}
