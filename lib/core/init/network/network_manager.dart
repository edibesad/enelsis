import 'package:dio/dio.dart';
import 'package:enelsis/core/base/model/base_model.dart';
import 'package:enelsis/core/base/model/base_response_model.dart';
import 'package:enelsis/core/constants/app/api_constants.dart';
import 'dart:developer' as developer;

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
      final responseModel =
          BaseResponseModel<T>.fromJson(response.data, model: model);
      developer.log('\x1B[32m🛜 ${response.realUri}\x1B[0m');

      if (responseModel.result!) {
        developer.log('\x1B[32m🛜 ${responseModel.message}\x1B[0m');
      } else {
        developer.log('\x1B[31m🛜 ${responseModel.message}\x1B[0m');
      }
      return responseModel;
    } on DioException catch (e) {
      final BaseResponseModel<T> response = e.response == null
          ? BaseResponseModel(
              message: "Hata : ${e.message}",
              dataList: [],
              totalLen: 0,
              result: false)
          : BaseResponseModel.fromJson(e.response!.data);
      developer.log('\x1B[31m🛜 ${response.message}\x1B[0m');
      return response;
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

  Future<BaseResponseModel<T>> dioPost<T extends BaseModel>(
      String path, Map<String, dynamic> queryParameters) async {
    try {
      final response = await _dio.post(path, queryParameters: queryParameters);
      final responseModel = BaseResponseModel<T>.fromJson(response.data);
      developer.log('\x1B[32m🛜 ${response.realUri}\x1B[0m');

      if (responseModel.result!) {
        developer.log('\x1B[32m🛜 ${responseModel.message}\x1B[0m');
      } else {
        developer.log('\x1B[31m🛜 ${responseModel.message}\x1B[0m');
      }
      return responseModel;
    } on DioException catch (e) {
      final BaseResponseModel<T> response = e.response == null
          ? BaseResponseModel(
              message: "Hata : ${e.message}",
              dataList: [],
              totalLen: 0,
              result: false)
          : BaseResponseModel.fromJson(e.response!.data);
      developer.log('\x1B[31m🛜 ${response.message}\x1B[0m');
      return response;
    } catch (e) {
      return BaseResponseModel(
          message: "Hata : $e", dataList: [], totalLen: 0, result: false);
    }
  }

  Future<BaseResponseModel<T>> dioDelete<T extends BaseModel>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.delete(path, queryParameters: queryParameters);
      final responseModel = BaseResponseModel<T>.fromJson(response.data);
      developer.log('\x1B[32m🛜 ${response.realUri}\x1B[0m');

      if (responseModel.result!) {
        developer.log('\x1B[32m🛜 ${responseModel.message}\x1B[0m');
      } else {
        developer.log('\x1B[31m🛜 ${responseModel.message}\x1B[0m');
      }
      return responseModel;
    } on DioException catch (e) {
      final BaseResponseModel<T> response = e.response == null
          ? BaseResponseModel(
              message: "Hata : ${e.message}",
              dataList: [],
              totalLen: 0,
              result: false)
          : BaseResponseModel.fromJson(e.response!.data);
      developer.log('\x1B[31m🛜 ${response.message}\x1B[0m');
      return response;
    } catch (e) {
      return BaseResponseModel(
          message: "Hata : $e", dataList: [], totalLen: 0, result: false);
    }
  }
}
