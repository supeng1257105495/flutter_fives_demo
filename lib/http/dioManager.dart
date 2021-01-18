import 'package:dio/dio.dart';
import 'package:hello_world_flutter/http/BaseEntity.dart';
import 'package:hello_world_flutter/http/EntityFactory.dart';
import 'package:hello_world_flutter/http/ErrorEntity.dart';
import 'package:hello_world_flutter/http/NWApi.dart';
import 'package:hello_world_flutter/http/NWMethod.dart';

///
/// DioManager：Dio辅助类
/// NWMethod：请求方法，get、post等
/// NWApi：默认配置api
/// EntityFactory：json转换辅助工厂，把json转为T
/// BaseEntity<T>：数据基类，返回的参数为 {“code”: 0, “message”: “”, “data”: {}}
/// BaseListEntity<T>：数据基类2，返回的参数为 {“code”: 0, “message”: “”, “data”: []}
/// ErrorEntity：请求报错基类，{“code”: 0, “message”: “”}

class DioManager {
  static final DioManager _shared = DioManager._internal();
  factory DioManager() => _shared;
  Dio dio;
  DioManager._internal() {
    if (dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: NWApi.baseApi,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        receiveDataWhenStatusError: false,
        connectTimeout: 30000,
        receiveTimeout: 3000,
      );
      dio = Dio(options);
    }
  }

  // 请求，返回参数为 T
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future request<T>(NWMethod method, String path,
      {Map<String, dynamic> params,
      Function(T) success,
      Function(ErrorEntity) error}) async {
    try {
      Response response = await dio.request(path,
          queryParameters: params,
          options: Options(method: NWMethodValues[method]));
      if (response != null) {
        BaseEntity entity = BaseEntity<T>.fromJson(response.data);
        if (entity.code == 0) {
          success(entity.data);
        } else {
          error(ErrorEntity(code: entity.code, message: entity.message));
        }
      } else {
        error(ErrorEntity(code: -1, message: "未知错误"));
      }
    } on DioError catch (e) {
      error(createErrorEntity(e));
    }
  }

  // 请求，返回参数为 List<T>
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future requestList<T>(NWMethod method, String path,
      {Map<String, dynamic> params,
      Function(List<T>) success,
      Function(ErrorEntity) error}) async {
    try {
      Response response = await dio.request(path,
          queryParameters: params,
          options: Options(method: NWMethodValues[method]));
      if (response != null) {
        BaseListEntity entity = BaseListEntity<T>.fromJson(response.data);
        if (entity.code == 0) {
          success(entity.data);
        } else {
          error(ErrorEntity(code: entity.code, message: entity.message));
        }
      } else {
        error(ErrorEntity(code: -1, message: "未知错误"));
      }
    } on DioError catch (e) {
      error(createErrorEntity(e));
    }
  }

  // 错误信息
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        {
          return ErrorEntity(code: -1, message: "请求取消");
        }
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "连接超时");
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "请求超时");
        }
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "响应超时");
        }
        break;
      case DioErrorType.RESPONSE:
        {
          try {
            int errCode = error.response.statusCode;
            String errMsg = error.response.statusMessage;
            switch (errCode) {
              case 400:
                {
                  return ErrorEntity(code: errCode, message: "请求语法错误 $errMsg");
                }
                break;
              case 403:
                {
                  return ErrorEntity(code: errCode, message: "服务器拒绝执行 $errMsg");
                }
                break;
              case 404:
                {
                  return ErrorEntity(code: errCode, message: "无法连接服务器 $errMsg");
                }
                break;
              case 405:
                {
                  return ErrorEntity(code: errCode, message: "请求方法被禁止 $errMsg");
                }
                break;
              case 500:
                {
                  return ErrorEntity(code: errCode, message: "服务器内部错误 $errMsg");
                }
                break;
              case 502:
                {
                  return ErrorEntity(code: errCode, message: "无效的请求 $errMsg");
                }
                break;
              case 503:
                {
                  return ErrorEntity(code: errCode, message: "服务器挂了 $errMsg");
                }
                break;
              case 505:
                {
                  return ErrorEntity(
                      code: errCode, message: "不支持HTTP协议请求 $errMsg");
                }
                break;
              default:
                {
                  return ErrorEntity(code: errCode, message: "未知错误 $errMsg");
                }
            }
            // return ErrorEntity(code: errCode, message: errMsg);
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "未知错误");
          }
        }
        break;
      default:
        {
          return ErrorEntity(code: -1, message: error.message);
        }
    }
  }
}

class BaseListEntity<T> {
  int code;
  String message;
  List<T> data;

  BaseListEntity({this.code, this.message, this.data});

  factory BaseListEntity.fromJson(json) {
    List<T> mData = new List<T>();
    if (json['data'] != null) {
      //遍历data并转换为我们传进来的类型
      (json['data'] as List).forEach((v) {
        mData.add(EntityFactory.generateOBJ<T>(v));
      });
    }

    return BaseListEntity(
      code: json["code"],
      message: json["msg"],
      data: mData,
    );
  }
}
