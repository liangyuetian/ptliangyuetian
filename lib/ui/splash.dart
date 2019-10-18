import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => Future.value(false), // 不允许返回
        child: new Text('哎呀，我是欢迎页'),
      ),
    );
  }
}
