import 'package:wanandroid/generated/json/base/json_field.dart';
import 'package:wanandroid/models/api_response.g.dart';
import 'dart:convert';

class ApiResponse<T> {

	int? code;
	String? message;
  T ? data;
  
  ApiResponse();

  factory ApiResponse.fromJson(Map<String, dynamic> json) => $ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => $ApiResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

