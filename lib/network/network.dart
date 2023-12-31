import 'package:dio/dio.dart';
import 'package:flower_prediction/models/base_api_response.dart';
import 'package:flower_prediction/utils/enums/request_types.dart';
import 'package:flutter/foundation.dart';

class Network {
  static Future<BaseAPIResponse> request(
      {required RequestType method,
      required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParams}) async {
    final dio = Dio();
    Response? response;

    if (headers != null) {}
    try {
      switch (method) {
        case RequestType.get:
          response = await dio.get(url, queryParameters: queryParams);
          break;
        case RequestType.post:
          response = response = await dio.post(url, data: body);

          break;
        case RequestType.put:
          response = response = await dio.put(url, data: body);
          break;
        case RequestType.patch:
          break;
        case RequestType.delete:
          response = response = await dio.delete(url, data: body);
          break;
      }
      if (response!.statusCode == 200 && response.data["status_code"] == 200) {
        return BaseAPIResponse(data: response.data['data'], error: false, status: response.statusCode);
      } else {
        return BaseAPIResponse(data: response.data['data'], error: true, status: response.statusCode);
      }
    } on DioException catch (e) {
      if (kDebugMode) print(e);
      return BaseAPIResponse(data: null, error: true, status: e.response?.statusCode);
    }
  }

  static Future<BaseAPIResponse> upload(
      {required FormData formData,
      required String endpoint,
      required Function(int, int)? onSendProgress}) async {
    Dio dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 20);

    try {
      var response = await dio.post(
        endpoint,
        data: formData,
        onSendProgress: onSendProgress,
      );

      return BaseAPIResponse(data: response.data['data'], error: false, status: response.statusCode);
    } on DioException catch (e) {
      return BaseAPIResponse(data: null, error: true, status: e.response?.statusCode);
    }
  }
}
