import 'package:flutter/material.dart';
import 'package:hello_flutter/common/git_api.dart';
import 'package:hello_flutter/models/index.dart';
import 'package:hello_flutter/states/index.dart';
import 'package:provider/provider.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginRoute')
        // title: Text(GmLocalizations.of(context).home),
      ),
      // body: _buildBody(context), // 构建主页面
      // drawer: MyDrawer(), //抽屉菜单
    );
  }
}

// Widget _buildBody(context) {
//     UserModel userModel = Provider.of<UserModel>(context);
//     if (!userModel.isLogin) {
//       //用户未登录，显示登录按钮
//       return Center(
//         child: RaisedButton(
//           // child: Text(GmLocalizations.of(context).login),
//           onPressed: () => Navigator.of(context).pushNamed("login"),
//         ),
//       );
//     } else {
//       //已登录，则展示项目列表
//       return InfiniteListView<Repo>(
//         onRetrieveData: (int page, List<Repo> items, bool refresh) async {
//           var data = await Git(context).getRepos(
//             refresh: refresh,
//             queryParameters: {
//               'page': page,
//               'page_size': 20,
//             },
//           );
//           //把请求到的新数据添加到items中
//           items.addAll(data); 
//           // 如果接口返回的数量等于'page_size'，则认为还有数据，反之则认为最后一页
//           return data.length==20;
//         },
//         itemBuilder: (List list, int index, BuildContext ctx) {
//           // 项目信息列表项
//           return RepoItem(list[index]);
//         },
//       );
//     }
//   }
// }