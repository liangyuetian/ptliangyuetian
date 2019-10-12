import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptliangyuetian/config/global/global_config.dart';
import 'package:ptliangyuetian/pages/main/main_page.dart';

class ProviderConfig {
  static ProviderConfig _instance;

  static ProviderConfig getInstance() {
    if (_instance == null) {
      _instance = ProviderConfig._internal();
    }
    return _instance;
  }

  ProviderConfig._internal();

  /// 全局provider
  ChangeNotifierProvider<GlobalConfig> getGlobal(Widget child) {
    return ChangeNotifierProvider<GlobalConfig>(
      builder: (context) => GlobalConfig(),
      child: child,
    );
  }

  /// 主页provider
  ChangeNotifierProvider getMainPage() {
    return ChangeNotifierProvider(
      child: MainPage(),
    );
  }
}