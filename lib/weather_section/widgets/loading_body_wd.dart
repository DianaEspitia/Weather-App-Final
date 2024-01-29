import 'package:flutter/material.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 100.0),
        Text(
          'Loading information',
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(height: 50.0),
        CircularProgressIndicator(color: Colors.blueAccent),
        SizedBox(height: 50.0),
        Text(
          'Please wait',
          style: TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}
