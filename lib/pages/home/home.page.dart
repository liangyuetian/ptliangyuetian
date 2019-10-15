import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:ptliangyuetian/router/application.dart';
import 'package:ptliangyuetian/router/routers.dart';

class HomePage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        // 宽度占满
        height: double.infinity,
        // 高度占满
        color: Colors.black12,
        margin: EdgeInsets.all(20),
        // 外边距
        child: new Column(
//              https://www.jianshu.com/p/1d003ab6c278
          mainAxisAlignment: MainAxisAlignment.start,
          // 主轴布局方式:column主轴方向是垂直的方向
          crossAxisAlignment: CrossAxisAlignment.start,
          // 交叉轴的布局方式:column来说就是水平方向的布局方式
          verticalDirection: VerticalDirection.down,
          // child的垂直布局方向
          textDirection: TextDirection.ltr,
          // 文字放向
          children: <Widget>[
            new Text('哈哈，这是我最可爱的妹子呢'),
            new CupertinoButton(
                padding: EdgeInsets.all(10), // padding 值
                color: Colors.amber,
                child: new Text('点击进入图灵社区'),
                onPressed: () {
                  gotoWeb(context);
                }),
            new Container(
              margin: EdgeInsets.all(10),
              child: new CupertinoButton(
//                    minSize: 20, // 可以理解为最小宽度
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  // 圆角 默认8
                  padding: EdgeInsets.all(10),
                  disabledColor: Colors.greenAccent,
                  color: Colors.red,
                  child: new Text('图灵社区-拥有的书'),
                  onPressed: () {
                    gotoWebBook(context);
                  }),
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: CupertinoButton.filled(
                  child: new Text('具有外边距的按钮'), onPressed: null),
            )
            //                new MaterialButton(child: new Text('打开SQL必知必会PDF'), onPressed: () => Navigator.push(
            //                  context,
            //                  MaterialPageRoute(builder: (context) => SQLKnow()),
            //                )),
          ],
        ));
  }

  gotoWeb(context) {
    String path = Uri.encodeComponent('https://www.ituring.com.cn/');
    String title = Uri.encodeComponent('首页-图灵社区');
    Application.router
        .navigateTo(context, '${Routes.webViewPage}?title=$title&url=$path');
  }

  gotoWebBook(context) {
    String path = Uri.encodeComponent('https://m.ituring.com.cn/user/owe-book');
    String title = Uri.encodeComponent('拥有的书');
    Application.router
        .navigateTo(context, '${Routes.webViewPage}?title=$title&url=$path');
  }
}
