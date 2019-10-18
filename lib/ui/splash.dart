import 'package:flutter/material.dart';

import 'package:ptliangyuetian/config/router_manger.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {

  final String bgImage = 'assets/images/006i7H6Hgy1fjyd32bpqhj319c1w0kjm.jpg';

  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      nextPage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => Future.value(false), // 不允许返回
        child: new Container(
          decoration: BoxDecoration(
              image: new DecorationImage(
                  fit: BoxFit.cover, // 全屏
                  image: AssetImage(bgImage)
              )
          ),
          child: new Center(
            child: new Text(
                '欢迎欢迎',
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 100
                ),
          )
          ),
        ),
      ),
    );
  }
}

void nextPage(context) {
  Navigator.of(context).pushReplacementNamed(RouteName.tab);
}

