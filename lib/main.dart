import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
      _cityName = _controller.text;
      _temperature = '${Random().nextInt(16) + 15}°C'; // Generates random temperature between 15°C and 30°C
      _weatherCondition = ['Sunny', 'Cloudy', 'Rainy'][Random().nextInt(3)]; // Randomly selects weather condition
    });
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
              onPressed: _fetchWeather, // Calls the fetch function
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            // Displaying the simulated weather information
            Text('City: $_cityName'),
            Text('Temperature: $_temperature'),
            Text('Condition: $_weatherCondition'),
          ],
        ),
      ),
    );
  }
}
