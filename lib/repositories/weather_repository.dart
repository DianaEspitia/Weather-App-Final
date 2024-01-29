import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app/models/city_weather_info_ui_model.dart';
import 'package:weather_app/models/city_weather_model.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherRepository {
  String apiKey = dotenv.get('API_KEY');
  final openWeatherAppAPI =
      'https://api.openweathermap.org/data/2.5/weather?q=city&units=metric&appid=apiKey';

  Future<CityWeatherInfoUIModel?> getSpecificCityWeatherData(
    String city,
  ) async {
    try {
      final updatedApiKey = openWeatherAppAPI
          .replaceAll("city", city)
          .replaceAll("apiKey", apiKey);
      final response = await http.get(Uri.parse(updatedApiKey));
      if (response.statusCode == 200) {
        final weatherData = CityWeatherModel.fromJson(
          json.decode(response.body) as Map<String, dynamic>,
        );
        return _fetchCityWeatherMetricsList(weatherData);
      }
      return CityWeatherInfoUIModel(city: '', country: '', weatherData: []);
    } catch (_) {
      return null;
    }
  }

  CityWeatherInfoUIModel? _fetchCityWeatherMetricsList(
    CityWeatherModel weatherData,
  ) {
    final cityName = weatherData.cityName ?? '';
    final countryName = weatherData.additionalData?.country ?? '';
    final clouds = weatherData.clouds?.all ?? 0;
    final humidity = weatherData.mainData?.humidity ?? 0;
    final pressure = weatherData.mainData?.pressure ?? 0;
    final icon = weatherData.weather?.first.icon ?? '';
    final currentTemperature = weatherData.mainData?.temp ?? 0.0;
    final temperature = weatherData.mainData?.feelsLike ?? 0.0;
    final mainData = weatherData.mainData;
    final minTemperature = mainData?.tempMin ?? 0.0;
    final maxTemperature = mainData?.tempMax ?? 0.0;
    final mainInformation = weatherData.weather?.first.main ?? '';
    final description = weatherData.weather?.first.description ?? '';
    final windSpeed = weatherData.wind?.speed ?? 0.0;
    final image = 'http://openweathermap.org/img/w/icon.png'.replaceAll(
      "icon",
      icon,
    );
    final nowTime = DateTime.now();
    final DateFormat formatter = DateFormat('hh:mm');
    final List<WeatherInfoCardModel> weatherMetrics = [
      WeatherInfoCardModel(
        title: cityName,
        firstDescription: formatter.format(nowTime),
        image: image,
        value: '$currentTemperature °C',
        smallCard: false,
      ),
      WeatherInfoCardModel(
        title: 'Temperature feels like',
        icon: WeatherIcons.thermometer,
        iconColor: Colors.orange.shade700,
        firstDescription: 'Min: $minTemperature °C',
        secondDescription: 'Max: $maxTemperature °C',
        value: '$temperature °C',
        smallCard: false,
      ),
      WeatherInfoCardModel(
        title: 'Cloud cover',
        icon: WeatherIcons.cloudy,
        iconColor: Colors.blue.shade200,
        firstDescription: mainInformation,
        secondDescription: description,
        value: '$clouds %',
        smallCard: false,
      ),
      WeatherInfoCardModel(
        title: 'Wind',
        icon: WeatherIcons.cloudy_windy,
        iconColor: Colors.blue.shade700,
        firstDescription: 'Speed: $windSpeed m/s',
        smallCard: false,
      ),
      WeatherInfoCardModel(
        title: 'Humidity',
        icon: WeatherIcons.humidity,
        iconColor: Colors.blue.shade200,
        firstDescription: '$humidity %',
        smallCard: true,
      ),
      WeatherInfoCardModel(
        title: 'Pressure',
        icon: WeatherIcons.barometer,
        iconColor: Colors.red.shade200,
        firstDescription: '$pressure hPA',
        smallCard: true,
      ),
    ];
    return CityWeatherInfoUIModel(
      city: cityName,
      country: countryName,
      weatherData: weatherMetrics,
    );
  }
}
