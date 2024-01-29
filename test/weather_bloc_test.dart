import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/models/city_weather_info_ui_model.dart';
import 'package:weather_app/repositories/weather_repository.dart';
import 'package:weather_app/weather_section/bloc/city_weather_bloc.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  group('CityWeatherBloc', () {
    late CityWeatherBloc cityWeatherBloc;
    late MockWeatherRepository mockWeatherRepository;

    setUp(() {
      mockWeatherRepository = MockWeatherRepository();
      cityWeatherBloc = CityWeatherBloc(mockWeatherRepository);
    });

    tearDown(() {
      cityWeatherBloc.close();
    });

    test('initial state is InitialState', () {
      expect(cityWeatherBloc.state, const InitialState());
    });

    blocTest<CityWeatherBloc, CityWeatherState>(
      'emits [LoadingDataState, SuccessInfoState] when FetchCityWeatherEvent is added',
      build: () {
        when(mockWeatherRepository.getSpecificCityWeatherData('Bogota'))
            .thenAnswer(
          (_) async => CityWeatherInfoUIModel(
            city: 'Bogota',
            country: 'CO',
            weatherData: [],
          ),
        );
        return cityWeatherBloc;
      },
      act: (bloc) => bloc.add(FetchCityWeatherEvent('Bogota')),
      expect: () => [
        const LoadingDataState('Bogota'),
        SuccessInfoState(
          CityWeatherInfoUIModel(
            city: 'Bogota',
            country: 'CO',
            weatherData: [],
          ),
          'Bogota',
        ),
      ],
    );

    blocTest<CityWeatherBloc, CityWeatherState>(
      'emits [LoadingDataState and ErrorInfoState] on unsuccessful data fetch',
      build: () => CityWeatherBloc(mockWeatherRepository),
      act: (bloc) => bloc.add(FetchCityWeatherEvent('Examples')),
      expect: () => [
        isA<LoadingDataState>(),
        isA<ErrorInfoState>(),
      ],
      verify: (bloc) {
        expect(bloc.state, isA<ErrorInfoState>());
        expect((bloc.state as ErrorInfoState).cityName, 'Examples');
      },
    );

    blocTest<CityWeatherBloc, CityWeatherState>(
      'emits [SaveCityNameState] on SaveCityNameEvent',
      build: () => cityWeatherBloc,
      act: (bloc) => bloc.add(SaveCityNameEvent('Bogota')),
      expect: () => [
        isA<SaveCityNameState>(),
      ],
      verify: (bloc) {
        expect(bloc.state, isA<SaveCityNameState>());
        expect((bloc.state as SaveCityNameState).cityName, 'Bogota');
      },
    );

    blocTest<CityWeatherBloc, CityWeatherState>(
      'emits [ClearCityNameState] on ClearCityNameEvent',
      build: () => cityWeatherBloc,
      act: (bloc) => bloc.add(ClearCityNameEvent()),
      expect: () => [
        isA<ClearCityNameState>(),
      ],
      verify: (bloc) {
        expect(bloc.state, isA<ClearCityNameState>());
      },
    );
  });
}
