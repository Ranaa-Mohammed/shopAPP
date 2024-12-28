import 'package:dio/dio.dart';

class DioHelper {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  ); // Create Dio instance with base configuration

  Future<dynamic> postData({
    required String url,
    dynamic queryParameters,
    required dynamic data,
    String lang = 'en',
    String? token,
  }) async {
    return await dio.post(
      url,
      data: data,
      options: Options(
        headers: {
          'lang': lang,
          'Authorization': token,
        },
      ),
    );
  }

  Future<dynamic> getData({
    required String url,
    dynamic queryParameters,
    dynamic data,
    String lang = 'en',
    String? token,
  }) async {
    return await dio.get(
      url,
      options: Options(
        headers: {
          'lang': lang,
          'Authorization': token ?? '',
        },
      ),
    );
  }
}