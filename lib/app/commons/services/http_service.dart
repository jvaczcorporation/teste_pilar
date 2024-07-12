import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:teste_pilar/app/commons/env.dart';

abstract class HttpService {
  Future get(String? url,
      {Options? options, Map<String, dynamic>? queryParameters});
  Future post(String path,
      {dynamic data, Options? options, Map<String, dynamic>? queryParameters});
  Future put(String path,
      {dynamic data, Options? options, Map<String, dynamic>? queryParameters});
  Future patch(String path,
      {dynamic data, Options? options, Map<String, dynamic>? queryParameters});
  Future delete(String url,
      {dynamic data, Options? options, Map<String, dynamic>? queryParameters});
  String reason(DioException e, {List<String> fields = const []});
}

class HttpServiceImpl implements HttpService {
  HttpServiceImpl();

  _buildInterceptorAuth() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers = await _headerBuilder(options.headers);

        return handler.next(options);
      },
    );
  }

  final _baseOptions = BaseOptions(
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 50),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  late final Dio _dio = Dio(_baseOptions)
    ..interceptors.add(_buildInterceptorAuth());

  @override
  Future get(String? url,
      {Options? options, Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.get(
      url!,
      options: options,
      queryParameters: queryParameters,
    );

    return response;
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.post(
      path,
      data: data,
      options: options,
      queryParameters: queryParameters,
    );
    return response;
  }

  @override
  Future put(
    String path, {
    dynamic data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.put(
      path,
      data: data,
      options: options,
      queryParameters: queryParameters,
    );
    return response;
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.patch(
      path,
      data: data,
      options: options,
      queryParameters: queryParameters,
    );
    return response;
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.delete(
      path,
      data: data,
      options: options,
      queryParameters: queryParameters,
    );
    return response;
  }

  @override
  String reason(DioException e, {List<String> fields = const []}) {
    try {
      final value = {
        'request_path': e.requestOptions.path,
        'response_data':
            e.response != null ? e.response!.data : 'response is null',
        'user': 'PUT USER HERE',
      };

      if (['POST', 'PUT'].contains(e.requestOptions.method) &&
          fields.isNotEmpty &&
          e.requestOptions.data is String) {
        final data = jsonDecode(e.requestOptions.data as String);

        for (final e in fields) {
          value[e] = data[e] ?? 'UNDEFINED';
        }
      }

      return jsonEncode(value);
    } catch (e, s) {
      throw Exception('Error on reason: $e\n$s');
    }
  }

  Future<Map<String, dynamic>> _headerBuilder(
    Map<String, dynamic> headers,
  ) async {
    if ((headers['Authorization'] ?? '').toString().isEmpty) {
      headers['Authorization'] = 'Bearer ${Env.apiKey}';
    }
    return headers;
  }
}
