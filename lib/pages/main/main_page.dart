import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ptliangyuetian/pages/sidebar/sidebar_page.dart';
import 'package:ptliangyuetian/pages/home/home.page.dart';
import 'package:ptliangyuetian/pages/setting/setting.page.dart';
import 'package:ptliangyuetian/router/routers.dart';
//import 'package:ptliangyuetian/pages/book/sql.dart';

class MainPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final String bgUrl = 'assets/images/006i7H6Hgy1fjyd32bpqhj319c1w0kjm.jpg';
  final String bgNetworkImage =
      'http://i3.17173cdn.com/2fhnvk/YWxqaGBf/cms3/bAvqIeblkajqaqA.jpg';
  List<BottomNavigationBarItem> appBottomBar = [];
  int _currentIndex = 0;
  List<Widget> _list = List();
  void initState() {
    super.initState();

    appBottomBar.add(BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: new Text('home 页')
    ));
    appBottomBar.add(BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: new Text('setting 页')
    ));
    _list.add(HomePage());
    _list.add(SettingPage());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // 设置背景相关
//        gradient: LinearGradient( // 设置背景渐变
//            colors: [Colors.amber, Colors.blue],
//            begin: Alignment.topCenter,
//            end: Alignment.bottomCenter),
        color: Color.fromRGBO(54, 50, 50, 1),
        image: new DecorationImage(
          image: new AssetImage(bgUrl),
//            image: new NetworkImage(bgNetworkImage),
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
        bottomNavigationBar: BottomNavigationBar(
          items: appBottomBar,
          currentIndex: _currentIndex,
          //shifting :按钮点击移动效果
          //fixed：固定
          type: BottomNavigationBarType.fixed,
          onTap: appBottomBarTapped,
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//        floatingActionButton: AnimatedFloatingButton(
//          bgColor: globalModel.isBgChangeWithCard
//              ? model.logic.getCurrentCardColor()
//              : null,
//        ),
        body: IndexedStack(
          index: _currentIndex,
          children: _list,
        ),
      ),
    );
  }



  void appBottomBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
