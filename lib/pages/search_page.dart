import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/main.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blueAccent,
        title: const Text(
          'Search City',
          // style: TextStyle(
          //   color: Colors.white,
          // ),
        ),
      ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Center(
            child: TextField(
              // onChanged: (value){},
              onSubmitted: (value) async {
                // WeatherModel? weatherModel = await WeatherService(Dio())
                //     .getCurrentWeather(cityName: value);
                // log(weatherModel!.weatherCondition);
                BlocProvider.of<GetWeatherCubit>(context)
                    .getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 28),
                labelText: 'Search',
                labelStyle: TextStyle(
                    color: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel?.weatherCondition)[50]!),
                suffixIcon: const Icon(Icons.search),
                hintText: 'Enter City Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  borderSide: BorderSide(
                    color: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel?.weatherCondition)[50]!,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  borderSide: BorderSide(
                    color: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel?.weatherCondition)[50]!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  borderSide: BorderSide(
                    color: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel?.weatherCondition)[50]!,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
