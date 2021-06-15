import 'dart:io';

import 'package:clone_epoint/app/app.dart';
import 'package:clone_epoint/const/const.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

enum RequestMethod { POST, GET }

class BaseRequest {
  static Dio dio = _getBaseDio();

  static Dio _getBaseDio() {
    Dio dio = Dio();

    dio.options.baseUrl = AppConst.baseUrl;
    dio.options.connectTimeout = AppConst.connectTimeout;
    dio.options.receiveTimeout = AppConst.connectTimeout;

    if (AppConst.baseUrl.startsWith("https://")) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }

    return dio;
  }

  void setOnErrorListener(Function(Object error) onErrorCallBack) {
    this.onErrorCallBack = onErrorCallBack;
  }

  Function(Object error) onErrorCallBack;

  Future<dynamic> sendRequest(String action, RequestMethod requestMethod,
      {dynamic jsonMap,
      bool isByte = false,
      bool isUploadService = false,
      bool isQueryParametersPost = false}) async {
    Response response;

    Map<String, dynamic> headers =
        await getBaseHeader(isUploadService: isUploadService);
    Options options;
    if (!isByte) {
      options = Options(headers: headers, method: requestMethod.toString());
    } else {
      options = Options(
          responseType: ResponseType.bytes,
          headers: headers,
          method: requestMethod.toString());
    }

    if (!action.startsWith('/')) {
      action = "/" + action;
    }
    try {
      if (requestMethod == RequestMethod.POST) {
        if (isQueryParametersPost) {
          response = await dio.post(action,
              queryParameters: jsonMap, options: options);
        } else {
          response = await dio.post(action, data: jsonMap, options: options);
        }
      } else {
        response =
            await dio.get(action, options: options, queryParameters: jsonMap);
      }
      dio.close();
      return response.data;
    } catch (e) {
      onErrorCallBack(e);
    }
  }

  Future<Map<String, String>> getBaseHeader(
      {bool sendToken = true, bool isUploadService = false}) async {
    Map<String, String> headers = Map<String, String>();

    if (!isUploadService) {
      headers['Content-Type'] = "application/json;charset=UTF-8";
    }

    if (sendToken || isUploadService) {
      headers['Authorization'] = HIVE_APP.get(AppConst.keyToken) ?? '';
    }

    return headers;
  }
}
