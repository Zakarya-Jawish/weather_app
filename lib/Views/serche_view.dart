// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        title: const Text(
          'Search City',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: TextField(
            onSubmitted: (text) {
              var cubit = BlocProvider.of<GetWeatherCubit>(context);
              cubit.getWeather(text: text);
              Navigator.pop(context);
            },
            controller: controller,
            enabled: true,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Colors.amber,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Colors.deepOrange,
                ),
              ),
              prefix: const Icon(Icons.search),
              contentPadding: const EdgeInsets.all(20),
              hintText: 'Where are you live?',
              labelText: 'Search',
              labelStyle: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
              hintStyle: const TextStyle(fontStyle: FontStyle.italic),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  controller.text = '';
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
