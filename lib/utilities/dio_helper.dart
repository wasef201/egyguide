import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://egyguide.xyz/api/',
          receiveDataWhenStatusError: true,
          ),
    );
  }
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? lang,
    String? token,
  }) async{
    dio.options.headers =
    {
      'Content-Type': 'application/json',
      'Authorization' : 'Bearer $token',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,

  }) async{

    dio.options.headers =
    {
      'Content-Type': 'application/json',
      'Authorization' : 'Bearer $token',
    };



    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> updateData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String? token,

  }) async{

    dio.options.headers =
    {
      'Content-Type': 'application/json',

    };



    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,

  }) async{

    dio.options.headers =
    {
      'Content-Type': 'application/json',

    };



    return await dio.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }

}
