import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  
  final TextEditingController _cityController = TextEditingController();

  // Define variables for weather data
  String cityName = '';
  String temperature = '';
  String weatherCondition = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Weather Info App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _cityController, // Use the controller to get input
                decoration: InputDecoration(
                  labelText: 'Enter city name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10), // Add spacing 
              ElevatedButton(
                onPressed: () {

                },
                child: Text('Fetch Weather'),
              ),
              SizedBox(height: 20), 
              Text('City: $cityName'), 
              Text('Temperature: $temperature'), 
              Text('Condition: $weatherCondition'), 
            ],
          ),
        ),
      ),
    );
  }
}
