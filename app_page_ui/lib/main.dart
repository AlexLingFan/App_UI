import 'package:app_page_ui/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));

  ///设置状态栏背景色为透明色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemUiOverlayStyle systemUiOverlayStyle =
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}


