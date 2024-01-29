import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/city_weather_info_ui_model.dart';
import 'package:weather_app/repositories/weather_repository.dart';

part 'city_weather_event.dart';
part 'city_weather_state.dart';

class CityWeatherBloc extends Bloc<CityWeatherEvent, CityWeatherState> {
  final WeatherRepository _weatherRepository;

  CityWeatherBloc(
    this._weatherRepository,
  ) : super(const InitialState()) {
    on<FetchCityWeatherEvent>((event, emit) async {
      emit(LoadingDataState(event.cityName));
      final response = await _fetchSpecificCityWeatherData();
      if (response == null ||
          (response.city.isEmpty &&
              response.country?.isEmpty == true &&
              response.weatherData?.isEmpty == true)) {
        emit(ErrorInfoState(event.cityName, response));
      } else {
        emit(SuccessInfoState(response, event.cityName));
      }
    });
    on<SaveCityNameEvent>(
      (event, emit) => emit(
        SaveCityNameState(
          event.cityName,
        ),
      ),
    );
    on<ClearCityNameEvent>(
      (event, emit) => emit(
        const ClearCityNameState(),
      ),
    );
  }

  Future<CityWeatherInfoUIModel?> _fetchSpecificCityWeatherData() async {
    final response = await _weatherRepository.getSpecificCityWeatherData(
      state.city ?? '',
    );
    return response;
  }
}
