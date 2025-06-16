import 'package:flutter/material.dart';
import 'constants.dart';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {

    Location location = await Location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=44,34&lon=10.99&appid=20a7a2abb54b0ee9ad26eb39e27b34ea',
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print('✅ Data: ${response.body}');
    } else {
      print('❌ Failed with status: ${response.statusCode}');
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
                getLocation();
                getData();
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
