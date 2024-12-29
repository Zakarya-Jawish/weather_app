import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

import 'Views/home_view.dart';
import 'cubits/get_weather_cubit/get_weathe_states.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetWeatherCubit>(
        create: (context) => GetWeatherCubit(),
        child: Builder(builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    appBarTheme: AppBarTheme(
                  backgroundColor: getWeatherColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.condition),
                )),
                home: const HomeView(),
              );
            },
          );
        }));
  }
}

MaterialColor getWeatherColor(String? condition) {
  switch (condition) {
    case null:
      return Colors.teal;
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'partly cloudy':
      return Colors.lightBlue;
    case 'cloudy':
    case 'overcast':
      return Colors.amber;
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.blueGrey;
    case 'patchy rain possible':
    case 'light rain':
    case 'patchy light rain':
    case 'light rain shower':
      return Colors.blue;
    case 'patchy snow possible':
    case 'light snow':
    case 'patchy light snow':
    case 'light snow showers':
      return Colors.cyan;
    case 'patchy sleet possible':
    case 'light sleet':
    case 'light sleet showers':
      return Colors.teal;
    case 'patchy freezing drizzle possible':
    case 'freezing drizzle':
    case 'light freezing rain':
      return Colors.lightBlue;
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.purple;
    case 'blowing snow':
    case 'blizzard':
    case 'moderate snow':
    case 'heavy snow':
      return Colors.indigo;
    case 'Moderate rain':
    case 'heavy rain':
    case 'torrential rain shower':
      return Colors.blue;
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.cyan;
    default:
      // Default color for other conditions
      return Colors.blueGrey;
  }
}
