import 'package:flutter/material.dart';
// model
// import 'package:hello_world_flutter/model/user.dart';

// menu page
import 'package:hello_world_flutter/pages/ui/home_screen.dart';
import 'package:hello_world_flutter/pages/ui/email_screen.dart';
import 'package:hello_world_flutter/pages/ui/pages_screen.dart';
import 'package:hello_world_flutter/pages/ui/airplay_screen.dart';

// logain
import 'package:hello_world_flutter/pages/ui/login.dart';

// storage
// import 'package:hello_world_flutter/pages/ui/user_provider.dart';

class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = [];

  @override
  void initState() {
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirplayScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /**
     * 根据是否有用户登录信息进入登录注册页面或者主页
        利用inheritedWidget，可以读取到父控件分享的数据
     */
    // User user = UserContainer.of(context).user;
    // print(user);
    // 如有无登陆信息则跳转登陆页
    // if (user == null) {
    // return new LoginPage();
    // } else {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _bottomNavigationColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _bottomNavigationColor,
            ),
            label: 'Email',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _bottomNavigationColor,
            ),
            label: 'Pages',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _bottomNavigationColor,
            ),
            label: 'Airplay',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
