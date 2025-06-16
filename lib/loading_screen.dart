import 'package:flutter/material.dart';
import 'constants.dart';

import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async {

    // await Geolocator.checkPermission();
    // await Geolocator.requestPermission();

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    print(position);
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
