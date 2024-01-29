import 'package:flutter/material.dart';
import 'package:weather_app/models/city_weather_info_ui_model.dart';
import 'package:weather_app/weather_section/widgets/weather_information_card_wd.dart';

class CityWeatherInformationSection extends StatelessWidget {
  final CityWeatherInfoUIModel cityWeatherData;
  const CityWeatherInformationSection({
    super.key,
    required this.cityWeatherData,
  });

  @override
  Widget build(BuildContext context) {
    final weatherMetrics = cityWeatherData.weatherData ?? [];
    return Column(
      children: [
        const Text(
          'WEATHER INFORMATION',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          'Location: ${cityWeatherData.city} ${cityWeatherData.country}',
          style: const TextStyle(
            fontSize: 15.0,
          ),
        ),
        const SizedBox(height: 16.0),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: weatherMetrics.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16.0),
          itemBuilder: (context, index) {
            return WeatherInformationCard(
              title: weatherMetrics[index].title,
              icon: weatherMetrics[index].icon,
              iconColor: weatherMetrics[index].iconColor,
              firstDescription: weatherMetrics[index].firstDescription,
              secondDescription: weatherMetrics[index].secondDescription,
              value: weatherMetrics[index].value,
              image: weatherMetrics[index].image,
            );
          },
        ),
      ],
    );
  }
}
