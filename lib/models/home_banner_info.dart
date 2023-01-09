import 'package:wanandroid/generated/json/base/json_field.dart';
import 'package:wanandroid/generated/json/home_banner_info.g.dart';
import 'dart:convert';

@JsonSerializable()
class HomeBannerInfo {

	String? desc;
	int? id;
	String? imagePath;
	int? isVisible;
	int? order;
	String? title;
	int? type;
	String? url;
  
  HomeBannerInfo();

  factory HomeBannerInfo.fromJson(Map<String, dynamic> json) => $HomeBannerInfoFromJson(json);

  Map<String, dynamic> toJson() => $HomeBannerInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}