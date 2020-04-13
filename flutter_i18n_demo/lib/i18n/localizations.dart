import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JRLocalizations {
  final Locale locale;
  JRLocalizations(this.locale);

  static JRLocalizations of(BuildContext context) {
    return Localizations.of(context, JRLocalizations);
  }

  static Map<String, Map<String, String>> _localizations = {};

  Future loadJson() async {
    // 1.记载json文件
    final jsonString = await rootBundle.loadString('assets/json/i18n.json');

    // 解析json
    Map<String, dynamic> map = json.decode(jsonString);

    // dynamic类型运行时转换成Map<String, String>会报错
    // 所以需要将value这个dynamic类型的值，做一次cast()转换，并切指定转换的类型为Map<String, String>即可
    _localizations = map.map((key, value) {
      return MapEntry(key, value.cast<String, String>());
    });
  }

  String get title {
    return _localizations[locale.languageCode]['title'];
  }

  String get hello {
    return _localizations[locale.languageCode]['hello'];
  }

  String get pickTime {
    return _localizations[locale.languageCode]['pickTime'];
  }
}
