import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:ptliangyuetian/pages/main/main_page.dart';
import 'package:ptliangyuetian/router/routers.dart';
import 'package:ptliangyuetian/router/application.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State {
  _MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    // 这里设置项目环境
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pt liangyuetian',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainPage(),
    );
  }
}
