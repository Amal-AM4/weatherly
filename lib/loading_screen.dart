import 'package:flutter/material.dart';
import 'constants.dart';

// import 'package:geolocator/geolocator.dart';

import 'location.dart';
import 'networking.dart';

import 'result_screen.dart';

const apiKey = '<secret key>';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var latitude;
  var longitude;

  void getLocationData() async {
    Location location = await Location.getCurrentLocation();
    latitude = location.latitude!.toStringAsFixed(5);
    longitude = location.longitude!.toStringAsFixed(5);

    String path =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';

    NetworkBrain networkBrain = NetworkBrain(path: path);
    var weatherData = await networkBrain.getData();

    if (!mounted) return; // ✅ SAFE check

    if (weatherData != null) {
      String mainData = weatherData['weather'][0]['main'];
      String locationName = weatherData['name'];
      double temperatureKelvin = weatherData['main']['temp'];
      double temperatureCelsius = temperatureKelvin - 273.15;
      int humidity = weatherData['main']['humidity'];
      double windSpeed = weatherData['wind']['speed'];
      String description = weatherData['weather'][0]['description'];

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            mainData: mainData,
            locationName: locationName,
            temperatureCelsius: temperatureCelsius,
            humidity: humidity,
            windSpeed: windSpeed,
            description: description,
          ),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/hevyrain.png', height: 280.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 55.0),
              child: Text(
                'Discover the Weather in Your City',
                textAlign: TextAlign.center,
                style: mainTitle,
              ),
            ),
            SizedBox(height: 21.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 68.5),
              child: Text(
                'Get to know your weather maps and redar precipation forecast',
                textAlign: TextAlign.center,
                style: smallPara,
              ),
            ),
            SizedBox(height: 54.0),
            GestureDetector(
              onTap: () {
                getLocationData();

                print('tapped');

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ResultScreen(locationName: locationName, temperatureCelsius: temperatureCelsius, humidity: humidity, windSpeed: windSpeed, description: description)),
                // );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.all(20),
                height: 58.0,
                decoration: BoxDecoration(
                  color: Colors.blue.shade600,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Get Weather',
                  textAlign: TextAlign.center,
                  style: btnTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
