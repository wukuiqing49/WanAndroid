import 'package:wanandroid/generated/json/base/json_convert_content.dart';
import 'package:wanandroid/models/api_response.dart';

ApiResponse<T> $ApiResponseFromJson<T>(Map<String, dynamic> json) {
	final ApiResponse<T> apiResponse = ApiResponse<T>();
	final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
	if (errorCode != null) {
		apiResponse.errorCode = errorCode;
	}
	final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
	if (errorMsg != null) {
		apiResponse.errorMsg = errorMsg;
	}

	final T ? data = jsonConvert.convert<T>(json['data']);
	if (data != null) {
		apiResponse.data = data;
	}
	return apiResponse;
}

Map<String, dynamic> $ApiResponseToJson(ApiResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['errorCode'] = entity.errorCode;
	data['errorMsg'] = entity.errorMsg;
	data['data'] = entity.data?.toJson();
	return data;
}