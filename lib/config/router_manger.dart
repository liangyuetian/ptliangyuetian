import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ptliangyuetian/widget/page_route_anim.dart';

// 页面
import 'package:ptliangyuetian/ui/splash.dart';
import 'package:ptliangyuetian/ui/page/tab/tab_navigator.dart';

class RouteName {
  static const String splash = 'splash';
  static const String tab = '/';
  static const String login = 'login';
  static const String register = 'register';
  static const String setting = 'setting';
}

// 静态路由
class RoutesConfig {
  static generate<String, WidgetBuilder>() {
    return {
      RouteName.splash: (BuildContext context) => SplashPage(),
      RouteName.tab: (BuildContext context) => TabNavigator(),
    };
  }
}

// 动态路由
class RouteGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return NoAnimRouteBuilder(SplashPage());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('没有找到这个路由：${settings.name}'),
              ),
            ));
    }
  }
}

/// Pop路由
class PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
