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
          width: double.infinity, // 宽度占满
          height: double.infinity, // 高度占满
          color: Colors.black12,
          margin: EdgeInsets.all(20), // 外边距
            child: new Column(
//              https://www.jianshu.com/p/1d003ab6c278
              mainAxisAlignment: MainAxisAlignment.start, // 主轴布局方式:column主轴方向是垂直的方向
              crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴的布局方式:column来说就是水平方向的布局方式
              verticalDirection: VerticalDirection.down, // child的垂直布局方向
              textDirection: TextDirection.ltr, // 文字放向
              children: <Widget>[
                new Text('哈哈，这是我最可爱的妹子呢'),
                new CupertinoButton(
                    padding: EdgeInsets.all(10), // padding 值
                    color: Colors.amber,
                    child: new Text('点击进入图灵社区'),
                    onPressed: () {
                      gotoWeb(context);
                    }),
                new CupertinoButton(
//                    minSize: 20, // 可以理解为最小宽度
                    borderRadius: BorderRadius.all(Radius.circular(4.0)), // 圆角 默认8
                    padding: EdgeInsets.all(10),
                    disabledColor: Colors.greenAccent,
                    color: Colors.red,
                    child: new Text('图灵社区-拥有的书'),
                    onPressed: () {
                      gotoWebBook(context);
                    }),
                new Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: CupertinoButton.filled(child: new Text('具有外边距的按钮'), onPressed: null),
                )
                //                new MaterialButton(child: new Text('打开SQL必知必会PDF'), onPressed: () => Navigator.push(
                //                  context,
                //                  MaterialPageRoute(builder: (context) => SQLKnow()),
                //                )),
              ],
            )),
      ),
    );
  }

  gotoWeb(context) {
    String path = Uri.encodeComponent('https://www.ituring.com.cn/');
    String title = Uri.encodeComponent('首页-图灵社区');
    Application.router
        .navigateTo(context, '${Routes.webViewPage}?title=$title&url=$path');
  }

  gotoWebBook(context) {
    String path = Uri.encodeComponent('https://www.ituring.com.cn/user/shelf');
    String title = Uri.encodeComponent('拥有的书');
    Application.router
        .navigateTo(context, '${Routes.webViewPage}?title=$title&url=$path');
  }
}
