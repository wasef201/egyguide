import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

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
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
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
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
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
  }) async {
    dio.options.headers = {
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
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization' : 'Bearer ${token}',
    };

    return await dio.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }

  // Try Add new POst

  static Future<Response> uploadImage({
    required File file,
    required String url,
    required String title,
    required int cat_id,
    required int state_id,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "media": await MultipartFile.fromFile(file.path, filename: fileName),
      'title':title,
      'description' : 'description',
      'category_id' : cat_id,
      'country_id' : 63,
      'state_id' : state_id,

    });

    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return await dio.post(
      url,
      data: formData,
    );
    ;
  }
}
