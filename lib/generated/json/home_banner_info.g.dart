import 'package:wanandroid/generated/json/base/json_convert_content.dart';
import 'package:wanandroid/models/home_banner_info.dart';

HomeBannerInfo $HomeBannerInfoFromJson(Map<String, dynamic> json) {
	final HomeBannerInfo homeBannerInfo = HomeBannerInfo();
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		homeBannerInfo.desc = desc;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		homeBannerInfo.id = id;
	}
	final String? imagePath = jsonConvert.convert<String>(json['imagePath']);
	if (imagePath != null) {
		homeBannerInfo.imagePath = imagePath;
	}
	final int? isVisible = jsonConvert.convert<int>(json['isVisible']);
	if (isVisible != null) {
		homeBannerInfo.isVisible = isVisible;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		homeBannerInfo.order = order;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		homeBannerInfo.title = title;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		homeBannerInfo.type = type;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		homeBannerInfo.url = url;
	}
	return homeBannerInfo;
}

Map<String, dynamic> $HomeBannerInfoToJson(HomeBannerInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['desc'] = entity.desc;
	data['id'] = entity.id;
	data['imagePath'] = entity.imagePath;
	data['isVisible'] = entity.isVisible;
	data['order'] = entity.order;
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['url'] = entity.url;
	return data;
}