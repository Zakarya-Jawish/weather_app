import '../../models/weather_model.dart';

class WeatherState {}

class InitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {
  WeatherFailureState(this.errorMessage);
  final String errorMessage;
}

class WeatherLoadingState extends WeatherState {}
