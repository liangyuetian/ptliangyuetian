import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:oktoast/oktoast.dart';
import 'package:ptliangyuetian/config/provider_manager.dart' as prefix0;
import 'package:ptliangyuetian/config/storage_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ptliangyuetian/config/router_manger.dart';

import 'package:ptliangyuetian/config/provider_manager.dart';
import 'package:ptliangyuetian/view_model/theme_model.dart';
import 'package:ptliangyuetian/view_model/locale_model.dart';
import 'package:ptliangyuetian/generated/i18n.dart';
import 'package:ptliangyuetian/pages/main/main_page.dart';
import 'package:ptliangyuetian/router/routers.dart';
import 'package:ptliangyuetian/router/application.dart';

main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized(); // 绑定widget 框架和Flutter engine的桥梁
  await StorageManager.init();
  runApp(MyApp());
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      statusBarColor: Colors.transparent,
//      statusBarBrightness: Brightness.light));
//  SystemChrome.setEnabledSystemUIOverlays([]); // 隐藏 状态栏和虚拟按键
//  SystemChrome.setEnabledSystemUIOverlays(
//      [SystemUiOverlay.top, SystemUiOverlay.bottom]
//  ); // 恢复状态栏和虚拟键盘

}

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State {

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
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      print('deviceLocale: $deviceLocale');
                      print('deviceLocale: $supportedLocales');
                    },
                    title: 'pt liangyuetian',
                    debugShowCheckedModeBanner: false, // 当为true时，在debug模式下显示右上角的debug字样的横幅，false即为不显示
                    showSemanticsDebugger: false, // 显示布局边界
                    theme: themeModel.themeData(),
                    darkTheme: themeModel.themeData(platformDarkMode: true),
                    locale: localeModel.locale, // 地点
                    localizationsDelegates: const [
                      S.delegate,
                      RefreshLocalizations.delegate, //下拉刷新
                      GlobalCupertinoLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate
                    ],
                    supportedLocales: S.delegate.supportedLocales, // 这几个 locales 缺一不可。。
//                    home: new MainPage(),
                    routes: RoutesConfig.generate(),
                    onGenerateRoute: RouteGenerate.generateRoute, // 路由不存在时处理
                    initialRoute: RouteName.splash, // 初始路由
                  ));
            })));
  }
}
