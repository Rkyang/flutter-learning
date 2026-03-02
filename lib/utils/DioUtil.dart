import 'package:dio/dio.dart';
import 'package:flutter_learning/constants/index.dart';

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
          handler.reject(error);
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _responseHandle(_dio.get(url, queryParameters: params));
  }

  /// 进一步处理返回结果
  Future<dynamic> _responseHandle(Future<Response<dynamic>> task) async {
    final responseData = await task;
    Map<String, dynamic> dataMap = responseData.data as Map<String, dynamic>;
    String code = dataMap['code'];
    if (code == GlobalConstants.successCode) {
      // success
      return dataMap['result'];
    }
    throw Exception(dataMap['msg'] ?? '加载异常');
  }
}

// 单例对象
final dioUtil = DioUtil();
