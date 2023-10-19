import 'dart:io';

import 'package:dio/dio.dart';
import 'package:enelsis/core/base/model/base_error.dart';
import 'package:enelsis/core/base/model/base_model.dart';

class NetworkManager {
  NetworkManager._init() {
    final baseOptions = BaseOptions(baseUrl: "");
    _dio = Dio(baseOptions);
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) => BaseError(e.message!),
      onResponse: (e, handler) => e.data,
    ));
  }
  static NetworkManager? _instance;
  late Dio _dio;

  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map<String, dynamic>) {
          return model.fromJson(responseBody);
        } else {
          return responseBody;
        }
    }
  }
}
