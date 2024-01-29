import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/models/city_weather_info_ui_model.dart';
import 'package:weather_app/repositories/weather_repository.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  group('WeatherRepository', () {
    late WeatherRepository weatherRepository;

    setUp(() {
      weatherRepository = WeatherRepository();
    });

    test('getSpecificCityWeatherData returns CityWeatherInfoUIModel on success',
        () async {
      final result =
          await weatherRepository.getSpecificCityWeatherData('Bogota');
      expect(result, isA<CityWeatherInfoUIModel>());
    });
  });
}
