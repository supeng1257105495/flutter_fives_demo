import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// 常见 底部导航栏
import 'package:hello_world_flutter/pages/navigation/bottom_navigation_widget.dart';
// 特殊 底部导航栏
// import 'pages/navigation/bottom_appBar_demo.dart';

// login 登陆页面
// import 'pages/login/login.dart';

void main() {
  debugPaintSizeEnabled = false; // 打开 布局线
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TheGorgeousLogin',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BottomNavigationWidget());
    // home: BottomAppBarDemo());
  }
}
