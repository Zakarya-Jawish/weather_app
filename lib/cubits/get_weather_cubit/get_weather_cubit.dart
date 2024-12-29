import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../services/weather_service.dart';
import 'get_weathe_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialState());
  // case 2
  //when my UI is complexty
  //i don't need pass data a lot so this case is good
  WeatherModel? weatherModel;
  getWeather({required String text}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await WeatherService(Dio()).getForcast(cityName: text);

      log(weatherModel!.cityName);
      //case 1
      //when my UI is sample and don't have a lot pranches
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
