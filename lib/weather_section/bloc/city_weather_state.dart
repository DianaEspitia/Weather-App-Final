part of 'city_weather_bloc.dart';

@immutable
abstract class CityWeatherState {
  final CityWeatherInfoUIModel? cityWeather;
  final String? city;
  final bool loading;

  const CityWeatherState({
    this.cityWeather,
    this.city,
    this.loading = false,
  });
}

class InitialState extends CityWeatherState {
  const InitialState()
      : super(
          cityWeather: null,
          city: null,
          loading: false,
        );
}

class SuccessInfoState extends CityWeatherState {
  final CityWeatherInfoUIModel? weatherInformation;
  final String? cityName;
  const SuccessInfoState(
    this.weatherInformation,
    this.cityName,
  ) : super(
          cityWeather: weatherInformation,
          city: cityName,
          loading: false,
        );
}

class SaveCityNameState extends CityWeatherState {
  final String? cityName;
  const SaveCityNameState(
    this.cityName,
  ) : super(
          city: cityName,
          loading: false,
        );
}

class ClearCityNameState extends CityWeatherState {
  const ClearCityNameState()
      : super(
          city: '',
          loading: false,
        );
}

class LoadingDataState extends CityWeatherState {
  final String? cityName;
  const LoadingDataState(this.cityName)
      : super(
          loading: true,
          city: cityName,
        );
}

class ErrorInfoState extends CityWeatherState {
  final CityWeatherInfoUIModel? weatherInformation;
  final String? cityName;
  const ErrorInfoState(
    this.cityName,
    this.weatherInformation,
  ) : super(
          cityWeather: weatherInformation,
          city: cityName,
          loading: false,
        );
}
