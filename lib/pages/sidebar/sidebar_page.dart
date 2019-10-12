import 'package:flutter/material.dart';

class SidebarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        getNavHeader(),
        ListTile(
          title: Text('我的账号'),
          leading: Icon(Icons.account_circle),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () async{
            debugPrint('点击了"我的账号"');
          },
        ),
        ListTile(
          title: Text('日历'),
          leading: Icon(Icons.calendar_today),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            debugPrint('点击了"日历"');
          },
        ),
      ],
    );
  }
  Widget getNavHeader() {
    return Container(
      height: 200,
      child: null,
      decoration: BoxDecoration(
        // 设置背景相关
        gradient: LinearGradient( // 设置背景渐变
            colors: [Colors.amber, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        color: Color.fromRGBO(54, 50, 50, 1),
        image: new DecorationImage(
//          image: new AssetImage(bgUrl),
            image: new AssetImage('assets/images/0069lnCQly1fi6knj5e8xj30xc0ma75u.jpg'),
            fit: BoxFit.cover
          //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
//          centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
        ),
      ),
    );
  }
}