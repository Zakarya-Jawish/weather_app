import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

import '../main.dart';

class Weatherinfo extends StatelessWidget {
  const Weatherinfo({super.key, required this.model});
  final WeatherModel model;
  @override
  Widget build(BuildContext context) {
    // case 2:
    // Access data directly from cubit :
    // var mycubit = BlocProvider.of<GetWeatherCubit>(context);
    // WeatherModel weatherModel2 = mycubit.weatherModel2;
    MaterialColor materialColor = getWeatherColor(model.condition);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            materialColor,
            materialColor.shade50,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            model.cityName,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Updated at ${model.date.hour % 12}:${model.date.minute}'),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https:${model.image!}',
              ),
              Text(
                '${model.temp}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'maxTemp: ${model.maxTemp.round()}\nminTemp: ${model.minTemp.round()}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            model.condition,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
