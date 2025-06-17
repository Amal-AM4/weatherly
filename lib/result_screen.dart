import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultScreen extends StatefulWidget {
  // const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // properties and methods

  var bgBodyColor = Color(0xff3e98d0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBodyColor,
      appBar: AppBar(
        title: Text(
          'CityName',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: bgBodyColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset('assets/images/sun.png', height: 320)],
              ),
            ),
            Expanded(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      '52\u00B0',
                      style: TextStyle(
                        fontSize: 82,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sunny',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text('H: 63\u00B0  | L: 51\u00B0'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Column(
                    children: [
                      Text('Suggestion', style: TextStyle(fontSize: 22)),
                      Text(
                        'Weather is good so put a good sun creame 🌞 on body in cityname',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
