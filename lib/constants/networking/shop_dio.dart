import 'package:dio/dio.dart';

class ShopDio {
  static Dio? dio;

  static defineDio() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'http://20.86.97.165/hazard/api/checkpoints/',
          receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> dioGetData(
      {String? url, Map<String, dynamic>? query}) async {
    return await dio!.get(url!, queryParameters: query);
  }

  static Future<Response> dioPostData({
    String? url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    return await dio!.post(url!, queryParameters: query, data: data);
  }

  static Future<Response> dioUpdateData(String url, Map<String, dynamic> query,
      Map<String, dynamic> headers) async {
    dio!.options.headers = headers;
    return await dio!.put(
      url,
      queryParameters: query,
    );
  }
}
