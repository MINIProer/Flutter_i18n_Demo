import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n_demo/i18n/localizations.dart';

class JRLocalizationsDelegate extends LocalizationsDelegate<JRLocalizations> {
  static JRLocalizationsDelegate delegate = JRLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['zh', 'en'].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<JRLocalizations> old) {
    // TODO: implement shouldReload
    return false; // 官方文档一般返回false
  }

  // 真正加载数据
  /**
   * 注意：该方法返回Future，因为国际化配置可能从服务器获取，也可能是本地json文件解析获取，所以需要异步来执行，通过返回Future.then((res){})来拿到相应的数据
   * 所以创建一个同步的Future -> SynchronousFuture
   */
  // @override
  // Future<JRLocalizations> load(Locale locale) {
  //   // TODO: implement load
  //   return SynchronousFuture(JRLocalizations(locale));
  // }

  @override
  Future<JRLocalizations> load(Locale locale) async {
    final localizations = JRLocalizations(locale);
    await localizations.loadJson();

    return localizations;
  }
}
