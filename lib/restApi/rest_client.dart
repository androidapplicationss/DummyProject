
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'rest_api.dart';
part 'rest_client.g.dart';





@RestApi(baseUrl: "https://osafe-api.odishamining.in/common/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("${Apis.path}/{code}")
  Future<String> extractUrl(@Path("code") String code);

}