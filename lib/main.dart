import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:oktoast/oktoast.dart';
import 'package:ptliangyuetian/config/provider_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:ptliangyuetian/view_model/theme_model.dart';
import 'package:ptliangyuetian/view_model/locale_model.dart';

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

  Widget app = MaterialApp(
    title: 'pt liangyuetian',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: new MainPage(),
  );

  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: MultiProvider(
          providers: providers,
          child: Consumer2<ThemeModel, LocaleModel>(
            builder: (context, themeModel, localeModel, child) {
              return RefreshConfiguration(
                hideFooterWhenNotFull: true,
                child: app,
              );
            }
          )
        )
    );
  }
}
