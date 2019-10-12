import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ptliangyuetian/pages/sidebar/sidebar_page.dart';
import 'package:ptliangyuetian/router/application.dart';
import 'package:ptliangyuetian/router/routers.dart';
//import 'package:ptliangyuetian/pages/book/sql.dart';

class MainPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final String bgUrl = 'assets/images/bAvqIeblkajqaqA.jpg';
  final String bgNetworkImage =
      'http://i3.17173cdn.com/2fhnvk/YWxqaGBf/cms3/bAvqIeblkajqaqA.jpg';

  @override
  Widget build(BuildContext context) {
//    final model = Provider.of<MainPageModel>(context);
//    final globalModel = Provider.of<GlobalModel>(context);
//    final size = MediaQuery.of(context).size;
//    model.setContext(context,globalModel: globalModel);
//    globalModel.setMainPageModel(model);
    return Container(
      decoration: BoxDecoration(
        // 设置背景相关
//        gradient: LinearGradient( // 设置背景渐变
//            colors: [Colors.amber, Colors.blue],
//            begin: Alignment.topCenter,
//            end: Alignment.bottomCenter),
        color: Color.fromRGBO(54, 50, 50, 1),
        image: new DecorationImage(
//          image: new AssetImage(bgUrl),
            image: new NetworkImage(bgNetworkImage),
            fit: BoxFit.cover
            //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
//          centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
            ),
      ),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('哈，这是一个看起来不错的app'),
          leading: FlatButton(
            child: new Icon(Icons.dehaze),
            onPressed: () {
//              Scaffold.of(context).openDrawer();
//              scaffoldKey.currentState.openDrawer();
              return scaffoldKey.currentState.openDrawer();
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                size: 28,
                color: Colors.amber,
              ),
              onPressed: () {
                print('哈哈哈，点击了右侧的IconButton');
              },
            )
          ],
        ),
        drawer: Drawer(
          child: new SidebarPage(),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//        floatingActionButton: AnimatedFloatingButton(
//          bgColor: globalModel.isBgChangeWithCard
//              ? model.logic.getCurrentCardColor()
//              : null,
//        ),
        body: Container(
          child: SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                new Text('哈哈，这是我最可爱的妹子呢'),
                new CupertinoButton(child: new Text('点击进入图灵社区'), onPressed: () {
                  gotoWeb(context);
                }),
//                new MaterialButton(child: new Text('打开SQL必知必会PDF'), onPressed: () => Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => SQLKnow()),
//                )),
              ],
            )
          ),
        ),
      ),
    );
  }

  gotoWeb(context) {
    print("点击按钮");
    String path = Uri.encodeComponent('https://www.ituring.com.cn/');
    String title = Uri.encodeComponent('首页-图灵社区');
    Application.router.navigateTo(context, '${Routes.webViewPage}?title=$title&url=$path');
  }


}
