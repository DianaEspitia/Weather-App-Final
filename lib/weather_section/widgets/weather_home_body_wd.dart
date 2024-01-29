import 'package:flutter/material.dart';

class WeatherHomeBody extends StatelessWidget {
  const WeatherHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '24 °C',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    height: 80.0,
                    child: Image.asset('assets/images/weather_image.png'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Today',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blueGrey.shade700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Search weather data by city',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blueGrey.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade800),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.blue.shade800,
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                //
                'Available data\n   🌦 Weather.\n   🌡 Temperature.\n   🌥 Cloud cover.\n   💨 Wind.\n   💧 Humidity.\n   📍 Pressure.',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Text(
          'Anywhere',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
