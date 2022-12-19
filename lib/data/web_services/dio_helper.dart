import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constats.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: Constants.Kapi,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    ));
  }

  // DioHelper() {
  //   BaseOptions options = BaseOptions(
  //     baseUrl: Constants.Kapi,
  //     receiveDataWhenStatusError: true,
  //     connectTimeout: 20 * 1000,
  //     receiveTimeout: 20 * 1000,
  //   );
  //   dio = Dio(options);
  // }
  //Get All Characters
  Future<Response> getData(
      {required String url, required Map<String, dynamic>? query}) async {
    // try {
    //   Response response = await dio.get(url, queryParameters: query);
    //   // print(response.data.toString());
    //   return response;
    // } catch (error) {
    //   print(error.toString());
    //   return [];
    // }
    Response response = await dio.get(url, queryParameters: query);
    return response;
  }
}
// getAllCharacter
