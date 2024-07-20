import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/main.dart';
import 'package:weather/pages/search_page.dart';
import 'package:weather/widgets/no_weather_body.dart';
import 'package:weather/widgets/weather_info_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blueAccent,
        title: const Text(
          'Weather App',
          // style: TextStyle(
          //   color: Colors.white,
          // ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchPage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              // color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else {
            return Container(
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //       colors: [
              //         getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
              //             .weatherModel
              //             ?.weatherCondition),
              //         getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
              //             .weatherModel
              //             ?.weatherCondition)[800]!,
              //         getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
              //             .weatherModel
              //             ?.weatherCondition)[50]!,
              //       ]),
              // ),
              child: const Center(
                  child: Text(
                '  Please Enter right country or city name                ',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              )),
            );
          }
        },
      ),
    );
  }
}
