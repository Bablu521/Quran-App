import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService({required this.dio});

  getQuran({required String endPoint}) async {
    Response response = await dio.get('http://api.alquran.cloud/v1$endPoint');
    Map<String, dynamic> json = response.data;
    return json;
  }
}
