import 'package:flutter/material.dart';
import 'constants.dart';

import 'package:geolocator/geolocator.dart';

import 'location.dart';
import 'networking.dart';


const apiKey = '20a7a2abb54b0ee9ad26eb39e27b34ea';

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

    String path = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
    
    NetworkBrain networkBrain = NetworkBrain(path: path);

    var WeatherData = await networkBrain.getData();

    print(WeatherData);

    // String cityName = decodedData['name'];
    // String weatherCondition = decodedData['weather'][0]['main'];
    // double temprature = decodedData['main']['temp'];


    
  }

  // https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey


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
