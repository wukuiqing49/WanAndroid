import 'package:wanandroid/generated/json/base/json_convert_content.dart';
import 'package:wanandroid/models/api_response.dart';

ApiResponse<T> $ApiResponseFromJson<T>(Map<String, dynamic> json) {
	final ApiResponse<T> apiResponse = ApiResponse<T>();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		apiResponse.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		apiResponse.message = message;
	}
	T ? data =json['data'] is List? jsonConvert.convertList<T>(json['data']) as T?: jsonConvert.convert<T>(json['data']);
	if (data != null) {
		apiResponse.data = data;
	}
	return apiResponse;
}

Map<String, dynamic> $ApiResponseToJson(ApiResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}