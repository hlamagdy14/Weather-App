import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:new_weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:new_weather_app/views/search_view.dart';
import 'package:new_weather_app/views/Weather_info_body.dart';
import 'package:new_weather_app/views/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchView()),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
          title: const Text(
            'Weather App',
          ),
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            print(state);
            if (state is WeatherInitialState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfo();
            } else {
              return const Text('oops!! there was an error occured');
            }
          },
        ));
  }
}
