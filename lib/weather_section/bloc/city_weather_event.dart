part of 'city_weather_bloc.dart';

@immutable
abstract class CityWeatherEvent {}

class FetchCityWeatherEvent extends CityWeatherEvent {
  final String cityName;
  FetchCityWeatherEvent(this.cityName);
}

class SaveCityNameEvent extends CityWeatherEvent {
  final String cityName;
  SaveCityNameEvent(this.cityName);
}

class ClearCityNameEvent extends CityWeatherEvent {
  ClearCityNameEvent();
}
