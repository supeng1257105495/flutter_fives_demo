// 基础配置
final String serverIp = '47.99.116.65:8899';

getUrl(url) {
  return "/5s.api/api/$url";
}

// /fives.web/assets/fives.config.json?dc=1611025371863
class NWApi {
  static final baseApi = "http://$serverIp";
}

class LoginApi {
  static final loginUrl = getUrl('Base_UserInfor/Login');
  static final testUrl = '/fives.web/assets/fives.config.json?dc=1611025371863';
}
