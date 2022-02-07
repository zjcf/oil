import 'package:dio/dio.dart';
import 'package:oil/model/session.dart';

class Http {
  static final Dio dio = Dio();

  static Options getOptions () {
    Options options = Options(
      headers: {
        "Authorization": Session.token
      }
    );
    return options;
  }
  
  static post (String api, {dynamic data, Map<String, dynamic>? params = const {}}) async {
    try {
      Options options = getOptions();
      Response response = await dio.post(Api.origin + api, data: data, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return e.response?.data;
    }
  }

  static get (String api, {Map<String, dynamic>? params = const {}}) async {
    try {
      Options options = getOptions();
      Response response = await dio.get(Api.origin + api, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return e.response?.data;
    }
  }
}

class Api {
  static const String origin = 'http://friparia.com:5002';

  // driver apis
  static const String driverLogin = '/api/fc/driver/login';
  static const String driverProfile = '/api/fc/driver/profile';
  static const String driverActive = '/api/fc/driver/active';
  static const String driverUnactice = '/api/fc/driver/active';
  static const String driverFinishOrder = '/api/fc/driver/finish_order';
  static const String driverCurrentOrder = '/api/fc/driver/current_order';
  static const String driverHistoryOrder = '/api/fc/driver/history_order';
  static const String driverCashOrder = '/api/fc/driver/cash_order';
  
  // customer apis
  static const String customerLogin = 'api/fc/customer/login';
}
