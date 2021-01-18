import 'package:flutter/material.dart';
import 'package:hello_world_flutter/style/theme.dart' as theme;

import 'package:hello_world_flutter/pages/ui/login/login_form.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final TextStyle titleTextStyle = TextStyle(
    fontSize: 36,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        /**
       * SafeArea，让内容显示在安全的可见区域
       * SafeArea，可以避免一些屏幕有刘海或者凹槽的问题
       */
        body: new SafeArea(
      child: new SingleChildScrollView(
          /**
             * 用SingleChildScrollView+Column，避免弹出键盘的时候，出现overFlow现象
             */
          child: new Container(
              /**这里要手动设置container的高度和宽度，不然显示不了
                 *  MediaQuery 获取屏幕宽度高度密度通知栏高度等屏幕信息
                 */
              height: MediaQuery.of(context).size.height - 25,
              width: MediaQuery.of(context).size.width,
              //设置渐变的背景 可以设置背景图片等
              /**
               * gradient: theme.Theme.primaryGradient 渐变颜色
               */
              decoration: new BoxDecoration(color: theme.Theme.loginBackColor),
              child: new Stack(
                // mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // title
                  new Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(
                        color: Colors.blue,
                        image: new DecorationImage(
                          image:
                              new ExactAssetImage('assets/login/login-bg.jpg'),
                          fit: BoxFit.cover,
                        )),
                    child: new Column(
                      children: [
                        new SizedBox(height: 110),
                        new Image.asset(
                          'assets/login/BTC.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                        new SizedBox(height: 30),
                        new Text(
                          "招商工业",
                          style: titleTextStyle,
                        ),
                        new SizedBox(height: 15),
                        new Text(
                          '安全生产管理系统',
                          style: titleTextStyle,
                        ),
                      ],
                    ),
                  ),
                  // form
                  new Positioned(
                    top: MediaQuery.of(context).size.height / 10 * 4,
                    left: MediaQuery.of(context).size.width / 10 * 0.75,
                    child: new Container(
                      height: MediaQuery.of(context).size.height / 10 * 5,
                      width: MediaQuery.of(context).size.width / 10 * 8.5,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      padding: new EdgeInsets.all(16.0),
                      child: new Container(
                        child: LoginForm(),
                      ),
                    ),
                  ),
                  new Positioned(
                    bottom: MediaQuery.of(context).size.height / 10 * 0.1,
                    left: MediaQuery.of(context).size.width / 10 * 2.5,
                    child: new Row(
                      children: [
                        new Text('版权归申博所有 登录即代表同意'),
                        new TextButton(
                          onPressed: () {},
                          child: new Text('《服务协议》'),
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
    ));
  }
}
