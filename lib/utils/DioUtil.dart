import 'package:dio/dio.dart';
import 'package:flutter_learning/constants/index.dart';
import 'package:flutter_learning/stores/TokenManager.dart';

class DioUtil {
  final _dio = Dio();

  DioUtil() {
    _dio.options
      ..baseUrl = GlobalConstants.baseUrl
      ..connectTimeout = Duration(seconds: GlobalConstants.timeOut)
      ..receiveTimeout = Duration(seconds: GlobalConstants.timeOut);

    // 添加拦截器
    _addInterceptor();
  }

  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handle) {
          // token 注入
          if (tokenManager.getToken().isNotEmpty) {
            request.headers = {
              'Authorization': 'Bearer ${tokenManager.getToken()}'
            };
          }
          handle.next(request);
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
            return;
          }
          handler.reject(DioException(requestOptions: response.requestOptions));
        },
        onError: (error, handler) {
          // handler.reject(error);
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              message: error.response?.data['msg'] ?? 'Failed',
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _responseHandle(_dio.get(url, queryParameters: params));
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? data}) {
    return _responseHandle(_dio.post(url, data: data));
  }

  /// 进一步处理返回结果
  Future<dynamic> _responseHandle(Future<Response<dynamic>> task) async {
    try {
      final responseData = await task;
      Map<String, dynamic> dataMap = responseData.data as Map<String, dynamic>;
      String code = dataMap['code'];
      if (code == GlobalConstants.successCode) {
        // success
        return dataMap['result'];
      }
    } catch (e) {
      rethrow; // 不改变原来抛出的异常类型
    }
  }
}

// 单例对象
final dioUtil = DioUtil();
