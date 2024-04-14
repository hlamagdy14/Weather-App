import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:new_weather_app/models/weather_models.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '72a603c7b3e74273915120655242603';

  WeatherServices(this.dio);
  Future<WeatherModel> getCurrentWeather({
    required String cityName,
  }) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errormessage = e.response?.data['error']['message']?? 'oops something went wrong!';
      

  throw Exception(errormessage);
    }
    catch (e) {
      log(e.toString());
      throw Exception('oops something went wrong!');
    }
  }

  Future<WeatherModel> getForecast({
    required String cityName,
  }) async {
    Response response = await dio.get(
        '$baseUrl/v1/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }
}
