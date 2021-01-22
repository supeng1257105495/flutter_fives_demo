import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// icon
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 存储
import 'package:shared_preferences/shared_preferences.dart';

// theme
import 'package:hello_world_flutter/style/theme.dart' as theme;

// http 请求
import 'package:hello_world_flutter/http/NWApi.dart';
import 'package:hello_world_flutter/http/NWMethod.dart';
import 'package:hello_world_flutter/http/dioManager.dart';

class LoginForm extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new SizedBox(height: 30),
        new Text(
          '欢迎回来',
          style: TextStyle(
            fontSize: 28,
            color: Colors.black87,
          ),
        ),
        new SizedBox(height: 0),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 15),
          child: new Container(
            height: 3,
            width: 80,
            decoration: new BoxDecoration(color: theme.Theme.themeBlue),
          ),
        ),
        buildSignInTextForm(context),
      ],
    );
  }

// 在使用Form的时候需要设置其key，通过key获取当前的FormState，然后可以调用FormState的save、validate、reset等方法
  final _signInFormKey = GlobalKey<FormState>();
  // 是否自动登录
  bool isAutomaticLogin = false;

// 是否显示password
  bool isShowPassWord = false;

// 切换是否显示密码
  void showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }

  //用户名
  String userName;

  //密码
  String password;

// flutter 焦点控件
// 利用FocusNode和FocusScopeNode来控制焦点
// 可以通过FocusNode.of(context)来获取widget树中默认的FocusScopeNode
  FocusNode userNameFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusScopeNode focusScopeNode = new FocusScopeNode();

  Widget buildSignInTextForm(BuildContext context) {
    return new Container(
      width: 400,
      height: 300,
      decoration: BoxDecoration(
        // color: theme.Theme.loginGradientEnd,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: new Form(
        key: _signInFormKey,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                  top: 5,
                  bottom: 10,
                ),
                child: new TextFormField(
                  decoration: new InputDecoration(
                    icon: new Icon(
                      FontAwesomeIcons.user,
                      color: Colors.black,
                    ),
                    hintText: "请输入用户名",
                    border: InputBorder.none,
                  ),
                  style: new TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  //关联焦点
                  focusNode: userNameFocusNode,
                  // 自动验证
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  /**
                 * 点击键盘确认按钮的回调
                 * 1.没有value回调
                 * 2.点击后不会关闭软键盘
                 */
                  onEditingComplete: () {
                    if (focusScopeNode == null) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    FocusScope.of(context).requestFocus(passwordFocusNode);
                  },
                  //验证
                  validator: (value) {
                    return value.trim().length > 0 ? null : "用户名不能为空";
                  },
                  onSaved: (value) {
                    userName = value;
                  },
                ),
              ),
            ),
            new Container(
              height: 1,
              width: 300,
              color: Colors.grey[400],
            ),
            new Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                  top: 20,
                  bottom: 10,
                ),
                child: new TextFormField(
                  decoration: new InputDecoration(
                    icon: new Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    hintText: "请输入密码",
                    border: InputBorder.none,
                    // 后缀标签
                    suffixIcon: new IconButton(
                      icon: new Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                      ),
                      onPressed: showPassWord,
                    ),
                  ),
                  focusNode: passwordFocusNode,
                  //输入密码，需要用*****显示
                  obscureText: !isShowPassWord,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: new TextStyle(fontSize: 16, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "请输入密码";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    password = value;
                  },
                ),
              ),
            ),
            new Container(
              height: 1,
              width: 300,
              color: Colors.grey[400],
            ),
            new Container(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                top: 20,
                bottom: 10,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  CupertinoSwitch(
                    activeColor: theme.Theme.themeBlue,
                    value: isAutomaticLogin,
                    onChanged: (bool value) {
                      setState(() {
                        isAutomaticLogin = value;
                      });
                    },
                  ),
                  new Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: new Text(
                      '自动登陆',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // new SizedBox(height: 15),
            buildSignInButton(context)
          ],
        ),
      ),
    );
  }

  // 登陆函数
  void loginFormHttp(String userName, String password) {
    // ScaffoldMessenger.of(context).removeCurrentSnackBar();
    // ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
    //   content: new Text("userName：$userName ，password：$password"),
    // ));

    // print(LoginApi.loginUrl);

    final params = {
      'UserName': 'wangyuanhai',
      'Pwd': 'MTIzU2hlbmJvMTIz',
    };

    // 登陆
    DioManager().requestPost(NWMethod.POST, LoginApi.loginUrl, params: params,
        success: (res) async {
      print(res);
    }, error: (error) {
      print("error code = ${error.code}, massage = ${error.message}");
    });
  }

  Widget buildSignInButton(BuildContext context) {
    return new Container(
      child: new Column(
        children: [
          new GestureDetector(
            child: new Container(
              width: 300,
              padding:
                  EdgeInsets.only(left: 42, right: 42, top: 10, bottom: 10),
              margin: EdgeInsets.only(bottom: 10),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: theme.Theme.themeBlue,
              ),
              child: new Text(
                "登陆",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              /**
               * 利用key来获取widget的状态FormState
               * 可以用过FormState对Form的子孙FromField进行统一的操作
              */
              if (_signInFormKey.currentState.validate()) {
                //调用所有自容器的save回调，保存表单内容
                _signInFormKey.currentState.save();

                //如果输入都检验通过，则进行登录操作
                loginFormHttp(userName, password);
              }
            },
          ),
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextButton(
                  onPressed: () {},
                  child: new Text('忘记密码'),
                ),
                new Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: new Container(
                    height: 10,
                    width: 1,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                ),
                new TextButton(
                  onPressed: () {},
                  child: new Text('修改密码'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
