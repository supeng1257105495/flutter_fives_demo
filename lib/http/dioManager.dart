import 'package:dio/dio.dart';

// import 'package:hello_world_flutter/http/BaseEntity.dart';
// import 'package:hello_world_flutter/http/BaseListEntity.dart';
// import 'package:hello_world_flutter/http/EntityFactory.dart';
import 'package:hello_world_flutter/http/ErrorEntity.dart';
// import 'package:hello_world_flutter/http/BaseEntity.dart';

import 'package:hello_world_flutter/http/NWApi.dart';
import 'package:hello_world_flutter/http/NWMethod.dart';

Map<String, dynamic> httpHeaders = {
  'Accept': 'application/json,*/*',
  'Content-Type': 'application/json',
  // 'token': DioUtils.TOKEN
};

class DioManager {
  static final DioManager _shared = DioManager._internal();
  factory DioManager() => _shared;
  Dio dio;
  DioManager._internal() {
    if (dio == null) {
      //  当响应状态码不是成功状态(如404)时，是否接收响应内容，如果是false,则response.data将会为null
      BaseOptions options = BaseOptions(
        baseUrl: NWApi.baseApi,
        receiveDataWhenStatusError: false,
        connectTimeout: 30000,
        headers: httpHeaders,
        receiveTimeout: 3000,
      );
      dio = Dio(options);
    }
  }

// POST
  Future requestPost<T>(NWMethod method, String path,
      {Map params, Function(T) success, Function(ErrorEntity) error}) async {
    try {
      Response response = await dio.request(
        path,
        data: new Map<String, dynamic>.from(params),
        options: Options(method: NWMethodValues[method]),
      );

      if (response != null) {
        // BaseEntity entity = BaseEntity<T>.fromJson(response.data);
        success(response.data);
        // if (entity.code == 0) {
        // success(entity.data);

        // } else {
        // error(ErrorEntity(code: entity.code, message: entity.message));
        // }
      } else {
        error(ErrorEntity(code: -1, message: "未知错误"));
      }
    } on DioError catch (e) {
      error(createErrorEntity(e));
    }
  }

// GET
  Future requestGet<T>(NWMethod method, String path,
      {Map params, Function(T) success, Function(ErrorEntity) error}) async {
    try {
      Response response = await dio.request(
        path,
        queryParameters: new Map<String, dynamic>.from(params),
        options: Options(method: NWMethodValues[method]),
      );
      if (response != null) {
        // BaseEntity entity = BaseEntity<T>.fromJson(response.data);
        // if (entity.code == 0) {
        // success(entity.data);
        // success(response.data);
        // } else {
        // error(ErrorEntity(code: entity.code, message: entity.message));
        // }
      } else {
        error(ErrorEntity(code: -1, message: "未知错误"));
      }
    } on DioError catch (e) {
      error(createErrorEntity(e));
    }
  }

  // 错误信息
  ErrorEntity createErrorEntity(DioError error) {
    print(error);
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
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "未知错误 ");
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
