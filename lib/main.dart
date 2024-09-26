import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _cityName = '';
  String _temperature = '';
  String _weatherCondition = '';

  void _fetchWeather() {
    setState(() {
      _cityName = _controller.text; // Get the city name from the TextField
      _temperature = _generateRandomTemperature();
      _weatherCondition = _generateRandomWeatherCondition();
    });
  }

  String _generateRandomTemperature() {
    Random random = Random();
    int temperature = random.nextInt(16) + 15; // Random temperature between 15°C and 30°C
    return '$temperature °C';
  }

  String _generateRandomWeatherCondition() {
    List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
    Random random = Random();
    return conditions[random.nextInt(conditions.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Info')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter city name'),
            ),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            Text('City: $_cityName'),
            Text('Temperature: $_temperature'),
            Text('Condition: $_weatherCondition'),
          ],
        ),
      ),
    );
  }
}
