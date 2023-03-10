import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';


import 'package:wanandroid/request/apis.dart';
import 'package:wanandroid/request/config.dart';
import 'package:wanandroid/request/exception.dart';
import 'package:wanandroid/request/raw_data.dart';
import 'package:wanandroid/request/token_interceptor.dart';
import 'package:wanandroid/utils/type_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../models/api_response.dart';

RequestClient requestClient = RequestClient();

class RequestClient {
  late Dio _dio;

  RequestClient() {
    _dio = Dio(
        BaseOptions(baseUrl: RequestConfig.baseUrl, connectTimeout: RequestConfig.connectTimeout));
    _dio.interceptors.add(TokenInterceptor());
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
  }

  Future<T?> request<T>(
    String url, {
    String method = "Get",
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool Function(ApiException)? onError,
  }) async {
    try {
      Options options = Options()
        ..method = method
        ..headers = headers;

      data = _convertRequestData(data);

      Response response = await _dio.request(url,
          queryParameters: queryParameters, data: data, options: options);

      return _handleResponse<T>(response);
    } catch (e) {
      var exception = ApiException.from(e);
      if(onError?.call(exception) != true){
        throw exception;
      }
    }

    return null;
  }

  _convertRequestData(data) {
    if (data != null) {
      data = jsonDecode(jsonEncode(data));
    }
    return data;
  }

  Future<T?> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) {
    return request(url,
        queryParameters: queryParameters,
        headers: headers,
        onError: onError);
  }

  Future<T?> post<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) {
    return request(url,
        method: "POST",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }

  Future<T?> delete<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers,
        bool showLoading = true,
        bool Function(ApiException)? onError,
      }) {
    return request(url,
        method: "DELETE",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }

  Future<T?> put<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers,
        bool showLoading = true,
        bool Function(ApiException)? onError,
      }) {
    return request(url,
        method: "PUT",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }

  ///????????????????????????
  T? _handleResponse<T>(Response response) {
    if (response.statusCode == 200) {
      if(T.toString() == (RawData).toString()){
        RawData raw = RawData();
        raw.value = response.data;
        return raw as T;
      }else {
        ApiResponse<T> apiResponse = ApiResponse<T>.fromJson(response.data);
        return _handleBusinessResponse<T>(apiResponse);
      }
    } else {
      var exception = ApiException(response.statusCode, ApiException.unknownException);
      throw exception;
    }
  }

  ///??????????????????
  T? _handleBusinessResponse<T>(ApiResponse<T> response) {
    if (response.errorCode == RequestConfig.successCode) {
      return response.data;
    } else {
      var exception = ApiException(response.errorCode, response.errorMsg);
      throw exception;
    }
  }
}
