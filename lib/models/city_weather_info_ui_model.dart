import 'package:flutter/material.dart';

class CityWeatherInfoUIModel {
  String city;
  String? country;
  List<WeatherInfoCardModel>? weatherData;

  CityWeatherInfoUIModel({
    required this.city,
    this.country,
    this.weatherData,
  });

  CityWeatherInfoUIModel copyWith({
    String? city,
    String? country,
    List<WeatherInfoCardModel>? weatherData,
  }) =>
      CityWeatherInfoUIModel(
        city: city ?? this.city,
        country: country ?? this.country,
        weatherData: weatherData ?? this.weatherData,
      );
}

class WeatherInfoCardModel {
  String title;
  String? firstDescription;
  String? secondDescription;
  IconData? icon;
  String? image;
  String? value;
  Color? iconColor;
  bool smallCard;

  WeatherInfoCardModel({
    required this.title,
    required this.smallCard,
    this.firstDescription,
    this.secondDescription,
    this.icon,
    this.image,
    this.value,
    this.iconColor,
  });

  WeatherInfoCardModel copyWith({
    String? title,
    String? firstDescription,
    String? secondDescription,
    IconData? icon,
    String? image,
    String? value,
    Color? iconColor,
    bool? smallCard,
  }) =>
      WeatherInfoCardModel(
        title: title ?? this.title,
        firstDescription: firstDescription ?? this.firstDescription,
        secondDescription: secondDescription ?? this.secondDescription,
        icon: icon ?? this.icon,
        image: image ?? this.image,
        value: value ?? this.value,
        iconColor: iconColor ?? this.iconColor,
        smallCard: smallCard ?? this.smallCard,
      );
}
