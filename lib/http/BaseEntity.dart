import 'package:hello_world_flutter/http/EntityFactory.dart';

class BaseEntity<T> {
  int code;
  String message;
  T data;

  BaseEntity({this.code, this.message, this.data});

  factory BaseEntity.fromJson(json) {
    return BaseEntity(
      code: json["code"],
      message: json["msg"],
      // data值需要经过工厂转换为我们传进来的类型
      data: EntityFactory.generateOBJ<T>(json["data"]),
    );
  }
}

class LoginEntity<T> {
  T user;
  T company;
  T roles;
  T functions;
  T department;
  T loginStates;

  LoginEntity({
    this.user,
    this.company,
    this.roles,
    this.functions,
    this.department,
    this.loginStates,
  });

  factory LoginEntity.fromJson(json) {
    return LoginEntity(
      user: json["User"],
      company: json["Company"],
      roles: json["Roles"],
      functions: json["Functions"],
      department: json["Department"],
      loginStates: json["loginStates"],
    );
  }
}
