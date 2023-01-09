

import 'package:wanandroid/request/config.dart';
import 'package:wanandroid/request/exception.dart';
import 'package:wanandroid/request/exception_handler.dart';
import 'package:wanandroid/utils/loading.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future request(Function() block,  {bool showLoading = true, bool Function(ApiException)? onError, }) async{
  try {
    await loading(block, isShowLoading:  showLoading);
  } catch (e) {
    handleException(ApiException.from(e), onError: onError);
  }
  return;
}