import 'package:flutter/material.dart';
import 'package:flutter_i18n_demo/i18n/localizations.dart';
import 'package:flutter_i18n_demo/i18n/localizations_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 支持那些语言
      supportedLocales: [
        Locale('zh'),
        Locale('en'),
      ],
      // 国际化支持配置
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        JRLocalizationsDelegate.delegate
      ],
      // 注意：上面两个国际化配置在android上面，已经生效，但是iOS需要在对应项目的xcode中对info.plist进行Localizations进行字段配置后，才能生效
      home: JRHomePage(),
    );
  }
}

class JRHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(JRLocalizations.of(context).title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              JRLocalizations.of(context).hello,
              style: TextStyle(fontSize: 30),
            ),
            RaisedButton(
                child: Text(JRLocalizations.of(context).pickTime),
                onPressed: () {
                  print('弹出日期选择框');
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000));
                })
          ],
        ),
      ),
    );
  }
}
