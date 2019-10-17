import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:oktoast/oktoast.dart';
import 'package:ptliangyuetian/config/provider_manager.dart' as prefix0;
import 'package:ptliangyuetian/config/storage_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:ptliangyuetian/config/provider_manager.dart';
import 'package:ptliangyuetian/view_model/theme_model.dart';
import 'package:ptliangyuetian/view_model/locale_model.dart';

import 'package:ptliangyuetian/pages/main/main_page.dart';
import 'package:ptliangyuetian/router/routers.dart';
import 'package:ptliangyuetian/router/application.dart';

main() async {
  Provider.debugCheckInvalidValueType = null;
  await StorageManager.init();
  runApp(MyApp());
}

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
    return OKToast(
        child: MultiProvider(
            providers: prefix0.providers,
            child: Consumer2<ThemeModel, LocaleModel>(
                builder: (context, themeModel, localeModel, child) {
              return RefreshConfiguration(
                  hideFooterWhenNotFull: true, //列表数据不满一页,不触发加载更多
                  child: MaterialApp(
                    title: 'pt liangyuetian',
//                    debugShowCheckedModeBanner: false,
                    theme: themeModel.themeData(),
                    darkTheme: themeModel.themeData(platformDarkMode: true),
                    locale: localeModel.locale,
                    home: new MainPage(),
                  ));
            })));
  }
}
