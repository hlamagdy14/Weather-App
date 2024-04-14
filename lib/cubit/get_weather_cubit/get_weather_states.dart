import 'package:new_weather_app/models/weather_models.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState(WeatherModel weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String errmessage;

  WeatherFailureState(this.errmessage);
}
