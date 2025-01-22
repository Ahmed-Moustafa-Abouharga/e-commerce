import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../resources/constants_manager.dart';
@singleton
class ApiManager {
  Dio dio = Dio(
    BaseOptions(baseUrl: AppConstants.baseUrl, headers: {},
    validateStatus: (statusCode)
    {
      if((statusCode! >= 200&& statusCode <300)&&(statusCode<500&&statusCode >=400))
        {
          return false;
        }
       return true;
    },),
  );

  Future<Response> getRequest(String endPoint,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    var response = await dio.get(
      endPoint,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
    return response;
  }

  Future<Response> postRequest({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  }) async {
  var response =   await dio.post(
      endPoint,
      options: Options(
        headers: headers,
      ),
      data: body,
    );
    return response;
  }
  Future<Response> postRequestFormData(
      String endPoint,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? body,
      ) async {
    var response =   await dio.post(
      endPoint,
      options: Options(
        headers: headers,
      ),
      data: FormData.fromMap(body!),
    );
    return response;
  }
}
