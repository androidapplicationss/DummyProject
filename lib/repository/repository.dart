import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:netzero/model/urlModel.dart';
import 'package:netzero/restApi/rest_client.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Repository {
  Future<UrlModel> fetchUrl(String code) async {
    try {
      final client =
      ApiClient(Dio(BaseOptions(contentType: "application/json")));
      final String response = await client.extractUrl(code);
      print(response);
      Map<String, dynamic> valueMap = json.decode(response);
      if(valueMap['status'] ==1){

        InAppWebView(
            initialUrlRequest: URLRequest(
                url: Uri.parse(valueMap['url'])
            ));

      }
      else{
        log("sdfsfs");
      }
      return UrlModel.fromJson(valueMap);

    } on DioError catch (e) {
      throw e.response.toString();
    }
  }
}
