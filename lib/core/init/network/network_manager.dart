import 'package:dio/dio.dart';
import 'package:enelsis/core/base/model/base_model.dart';
import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/constants/app/api_constants.dart';

class NetworkManager {
  static NetworkManager? _instance;
  late Dio _dio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: ApiConstants.BASEURL,
    );
    _dio = Dio(baseOptions);
  }

  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  Future<BaseResponseModel<T>> dioGet<T extends BaseModel>(String path, T model,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return BaseResponseModel<T>.fromJson(response.data, model: model);
    } catch (e) {
      return BaseResponseModel(
          message: "Hata : $e", dataList: [], totalLen: 0, result: false);
    }

    // switch (response.statusCode) {
    //   case HttpStatus.ok:
    // if (responseBody is List) {
    //   return responseBody.map((e) => model.fromJson(e)).toList();
    // } else if (responseBody is Map<String, dynamic>) {
    //   return model.fromJson(responseBody);
    // } else {
    //   return responseBody;
    // }
    // }
  }

  Future<BaseResponseModel> dioPost(
      String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.post(path, queryParameters: queryParameters);
      return BaseResponseModel.fromJson(response.data);
    } catch (e) {
      return BaseResponseModel(
          message: "Hata : $e", dataList: [], totalLen: 0, result: false);
    }
  }
}
