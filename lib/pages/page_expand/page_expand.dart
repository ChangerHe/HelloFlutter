import 'package:flutter/material.dart';

class PageExpand extends StatefulWidget {
  _PageExpandState createState() => _PageExpandState();
}

class _PageExpandState extends State<PageExpand> {
  int currentPanelIndex = -1;
  List<int> mList = new List();
  List<ExpandStateBean> expandStateList = new List();
  _PageExpandState() {
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
    print(mList);
    print(expandStateList);
  }

  _setCurrentIndex(index, isExpand) {
    setState(() {
      expandStateList[index].isOpen = !isExpand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('展开闭合组件'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          animationDuration: Duration(microseconds: 500),
          expansionCallback: (index, isExpand) {
            _setCurrentIndex(index, isExpand);
          },
          children: mList.map(
            (index) {
              return ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                      title: Text('Expansion Tile'),
                      leading: Icon(Icons.ac_unit),
                      selected: expandStateList[index].isOpen,
                      trailing: Text('123'),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 20)
                      // backgroundColor: Colors.white12,
                      );
                },
                body: ListTile(
                    title: Text('list tile'),
                    subtitle: Text('subtitle'),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 20)),
                isExpanded: expandStateList[index].isOpen,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class ExpandStateBean {
  var isOpen;
  var index;
  ExpandStateBean(this.index, this.isOpen);
}
