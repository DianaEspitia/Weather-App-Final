import 'package:flutter/material.dart';

class WeatherErrorBody extends StatelessWidget {
  final String errorMessage;
  const WeatherErrorBody({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
                      'ERROR',
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
                  'NO found information',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.blueGrey.shade700,
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
                child: Text(
                  errorMessage,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
