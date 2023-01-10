
import 'package:wanandroid/models/api_response.g.dart';
import 'dart:convert';

import '../generated/json/base/json_convert_content.dart';

class ApiResponse<T> {

	int? errorCode;
	String? errorMsg;
  T ? data;
  
  ApiResponse();

  factory ApiResponse.fromJson(Map<String, dynamic> json) => $ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => $ApiResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

}


