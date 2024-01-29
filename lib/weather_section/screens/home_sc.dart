import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/city_weather_info_ui_model.dart';
import 'package:weather_app/weather_section/bloc/city_weather_bloc.dart';
import 'package:weather_app/weather_section/widgets/city_weather_information_section_wd.dart';
import 'package:weather_app/weather_section/widgets/loading_body_wd.dart';
import 'package:weather_app/weather_section/widgets/search_city_info_wd.dart';
import 'package:weather_app/weather_section/widgets/weather_error_body_wd.dart';
import 'package:weather_app/weather_section/widgets/weather_home_body_wd.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<CityWeatherBloc, CityWeatherState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SearchCitySection(
                    city: state.city ?? '',
                    onClearPressed: _onClearPressed,
                    searchCityInformation: _searchCityInformation,
                  ),
                  const SizedBox(height: 16.0),
                  Visibility(
                    visible: !state.loading,
                    replacement: const LoadingBody(),
                    child: Visibility(
                      visible: _showWeatherBody(state),
                      replacement: CityWeatherInformationSection(
                        cityWeatherData: state.cityWeather ??
                            CityWeatherInfoUIModel(city: ''),
                      ),
                      child: Visibility(
                        visible:
                            state.city == null || state.city?.isEmpty == true,
                        replacement: WeatherErrorBody(
                          errorMessage: _getErrorMessage(
                            state.cityWeather,
                          ),
                        ),
                        child: const WeatherHomeBody(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool _showWeatherBody(CityWeatherState state) {
    final isCityEmpty = state.cityWeather?.city.isEmpty == true;
    final isCountryEmpty = state.cityWeather?.country?.isEmpty == true;
    final isDataEmpty = state.cityWeather?.weatherData?.isEmpty == true;
    return state.cityWeather == null ||
        (isCityEmpty && isCountryEmpty && isDataEmpty);
  }

  String _getErrorMessage(CityWeatherInfoUIModel? cityWeather) {
    if (cityWeather == null) return 'Something is wrong';
    return 'Verify the name of the city';
  }

  void _onClearPressed() {
    BlocProvider.of<CityWeatherBloc>(context).add(ClearCityNameEvent());
  }

  void _searchCityInformation(String city) {
    BlocProvider.of<CityWeatherBloc>(context).add(SaveCityNameEvent(city));
    BlocProvider.of<CityWeatherBloc>(context).add(FetchCityWeatherEvent(city));
  }
}
