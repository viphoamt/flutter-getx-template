import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_base/data/local/preference_manager.dart';
import 'package:flutter_getx_base/data/local/preference_manager_impl.dart';

class ApiProvider {
  late Dio dio;
  CancelToken cancelToken = CancelToken();
  static final ApiProvider _instance = ApiProvider._internal();

  factory ApiProvider() => _instance;

  ApiProvider._internal();

  void initApiProvider(String baseUrl) {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 20000,
      receiveTimeout: 5000,
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    dio = Dio(options);
    final CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          final ErrorEntity eInfo = createErrorEntity(e);
          EasyLoading.showInfo(eInfo.message.toString());
          switch (eInfo.code) {
            case 401:
              // deleteTokenAndReLogin();
              break;
            default:
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<Map<String, dynamic>> getAuthorizationHeader() async {
    var headers = <String, dynamic>{};
    final String? token =
        await PreferenceManagerImpl().getString(PreferenceManager.keyToken);
    if (token != null) {
      headers = {
        'Authorization': 'Bearer $token',
      };
    }
    return headers;
  }

  Future<Response?> post(
    String path, {
    dynamic params,
    Options? options,
  }) async {
    try {
      Options requestOptions = options ?? Options();
      final Map<String, dynamic> _authorization =
          await getAuthorizationHeader();
      if (_authorization.isNotEmpty) {
        requestOptions = requestOptions.copyWith(headers: _authorization);
      }
      final response = await dio.post(
        path,
        data: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<Response?> get(String path, {dynamic params, Options? options}) async {
    try {
      Options requestOptions = options ?? Options();

      final Map<String, dynamic> _authorization =
          await getAuthorizationHeader();
      if (_authorization.isNotEmpty) {
        requestOptions = requestOptions.copyWith(headers: _authorization);
      }
      final response = await dio.get(
        path,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<Response?> put(String path, {dynamic params, Options? options}) async {
    try {
      Options requestOptions = options ?? Options();
      final Map<String, dynamic> _authorization =
          await getAuthorizationHeader();
      if (_authorization.isNotEmpty) {
        requestOptions = requestOptions.copyWith(headers: _authorization);
      }
      final response = await dio.put(
        path,
        data: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<Response?> patch(
    String path, {
    dynamic params,
    Options? options,
  }) async {
    try {
      Options requestOptions = options ?? Options();

      final Map<String, dynamic> _authorization =
          await getAuthorizationHeader();
      if (_authorization.isNotEmpty) {
        requestOptions = requestOptions.copyWith(headers: _authorization);
      }

      final response = await dio.patch(
        path,
        data: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );

      return response;
    } catch (e) {
      return null;
    }
  }

  Future<Response?> delete(
    String path, {
    dynamic params,
    Options? options,
  }) async {
    try {
      Options requestOptions = options ?? Options();

      final Map<String, dynamic> _authorization =
          await getAuthorizationHeader();
      if (_authorization.isNotEmpty) {
        requestOptions = requestOptions.copyWith(headers: _authorization);
      }
      final response = await dio.delete(
        path,
        data: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      return null;
    }
  }

  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        {
          return ErrorEntity(code: -1, message: 'Request cancellation');
        }
      case DioErrorType.connectTimeout:
        {
          return ErrorEntity(code: -1, message: 'Connect timeout');
        }
      case DioErrorType.sendTimeout:
        {
          return ErrorEntity(code: -1, message: 'Request timeout');
        }
      case DioErrorType.other:
        {
          return ErrorEntity(code: -1, message: 'Connection refused');
        }
      case DioErrorType.receiveTimeout:
        {
          return ErrorEntity(code: -1, message: 'Response timeout');
        }
      case DioErrorType.response:
        {
          try {
            final int? errCode = error.response?.statusCode;
            if (errCode == null) {
              return ErrorEntity(code: -2, message: error.message);
            }
            switch (errCode) {
              case 400:
                {
                  return ErrorEntity(
                    code: errCode,
                    message: error.response?.data['message'] ??
                        'Request syntax error',
                  );
                }

              case 401:
                {
                  return ErrorEntity(
                    code: errCode,
                    message:
                        error.response?.data['message'] ?? 'Permission denied',
                  );
                }

              case 403:
                {
                  return ErrorEntity(
                    code: errCode,
                    message: error.response?.data['message'] ??
                        'Server refuses to execute',
                  );
                }
              case 404:
                {
                  return ErrorEntity(code: errCode, message: 'Unauthorized');
                }
              case 405:
                {
                  return ErrorEntity(
                    code: errCode,
                    message: error.response?.data['message'] ??
                        'Request method is forbidden',
                  );
                }
              case 500:
                {
                  return ErrorEntity(
                    code: errCode,
                    message: 'Internal server error',
                  );
                }
              case 502:
                {
                  return ErrorEntity(
                    code: errCode,
                    message: 'Invalid request',
                  );
                }
              case 503:
                {
                  return ErrorEntity(
                    code: errCode,
                    message: error.response?.data['message'] ?? 'Server hangs',
                  );
                }
              case 505:
                {
                  return ErrorEntity(
                    code: errCode,
                    message: error.response?.data['message'] ??
                        'HTTP protocol requests are not supported',
                  );
                }
              default:
                {
                  return ErrorEntity(
                    code: errCode,
                    message: error.response?.data['message'],
                  );
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: 'Unknown error');
          }
        }
      default:
        {
          return ErrorEntity(code: -1, message: error.message);
        }
    }
  }
}

class ErrorEntity implements Exception {
  int code;
  String? message;

  ErrorEntity({required this.code, this.message});

  @override
  String toString() {
    if (message == null) return 'Exception';
    return 'Exception: code $code, $message';
  }
}
