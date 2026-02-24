import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  // 基本使用
  // Dio()
  //     .get('https://geek.itheima.net/v1_0/channels')
  //     .then((res) {
  //       print(res);
  //     })
  //     .catchError(() {});

  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> _listData = [];

  @override
  void initState() {
    super.initState();
    _getDataList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Dio通信组件'), centerTitle: true),
        body: GridView.extent(
          maxCrossAxisExtent: 150,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(_listData.length, (index) {
            return DataItemWidget(item: _listData[index], index: index, delFunc: (index) {
              _listData.removeAt(index);
              setState(() {});
            },);
          }),
        ),
      ),
    );
  }

  void _getDataList() async {
    DioUtils du = DioUtils();
    Response<dynamic> resp = await du.get('channels');
    Map<String, dynamic> respDataMap = resp.data as Map<String, dynamic>;
    // print(respDataMap);
    List channelsList = respDataMap['data']['channels'] as List;
    // print(channelsList);
    List<Map<String, dynamic>> finalDataList = channelsList
        .cast<Map<String, dynamic>>();
    _listData = finalDataList;
    setState(() {});
    // print(_listData);
  }
}

class DataItemWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  final int index;
  final Function(int index) delFunc;
  const DataItemWidget({super.key, required this.item, required this.index, required this.delFunc});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            item['name'] ?? '无',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        IconButton(onPressed: () {
          delFunc(index);
        }, icon: Icon(Icons.delete), color: Colors.red,)
      ],
    );
  }
}

/// dio工具类
class DioUtils {
  final Dio _dio = Dio();

  DioUtils() {
    // _dio.options.baseUrl = 'https://geek.itheima.net/v1_0/';
    // _dio.options.connectTimeout = Duration(seconds: 10);
    // _dio.options.sendTimeout = Duration(seconds: 10);
    // _dio.options.receiveTimeout = Duration(seconds: 10);

    // 语法糖：连续调用赋值简写方式
    _dio.options
      ..baseUrl = 'https://geek.itheima.net/v1_0/'
      ..connectTimeout = Duration(seconds: 10)
      ..sendTimeout = Duration(seconds: 60)
      ..receiveTimeout = Duration(seconds: 10);

    // 拦截器
    _addInterceptor();
  }

  // 对外请求方法
  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? paramsMap}) {
    return _dio.get(url, queryParameters: paramsMap);
  }

  void _addInterceptor() {
    // 添加拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        // 请求拦截器
        onRequest: (options, handler) {
          handler.next(options); // 放行
          // handler.reject(DioException(requestOptions: options)); // 拒绝放行
        },

        // 响应拦截器
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
          } else {
            handler.reject(
              DioException(requestOptions: response.requestOptions),
            );
          }
        },

        // 错误拦截器
        onError: (error, handler) {
          handler.reject(DioException(requestOptions: error.requestOptions));
        },
      ),
    );
  }
}
