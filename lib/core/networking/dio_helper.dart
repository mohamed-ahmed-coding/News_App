import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:news_app/core/networking/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper{
  static Dio? dio;
  static void initDio(){
    dio ??= Dio(
        BaseOptions(
          baseUrl: ApiEndpoints.baseUrl,
          receiveDataWhenStatusError: true,
        )
      );
      dio!.interceptors.add(PrettyDioLogger());
  }
  static Future<Response?> getRequest({required String endPoint, required Map<String, dynamic> query}) async{
    try{
      Response response = await dio!.get(endPoint, queryParameters: query);
      return response;
    }
    catch(e){
      log(e.toString());
      return null;
    }
  }
}