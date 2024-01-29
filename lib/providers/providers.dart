import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:weather_app/repositories/weather_repository.dart';
import 'package:weather_app/weather_section/bloc/city_weather_bloc.dart';

final WeatherRepository _weatherRepository = WeatherRepository();

class Providers {
  static List<SingleChildWidget> blocProviders(BuildContext context) {
    return [
      BlocProvider(
        create: (context) => CityWeatherBloc(_weatherRepository),
      ),
    ];
  }
}
