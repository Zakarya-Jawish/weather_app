import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '05d4ceec86064697963204318242609';

  Future<WeatherModel> getForcast({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (error) {
      final String errorMaseege = error.response?.data['error']['message'] ??
          'Oops!! there was an error, try later..';
      throw Exception(errorMaseege);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops!! there was an error, try later..');
    }
  }
}
