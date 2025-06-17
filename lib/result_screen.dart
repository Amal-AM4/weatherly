import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final String? locationName;
  final double? temperatureCelsius;
  final String? mainData;
  final String? description;
  final int? humidity;
  final double? windSpeed;

  const ResultScreen({
    super.key,
    required this.mainData,
    required this.locationName,
    required this.temperatureCelsius,
    required this.humidity,
    required this.windSpeed,
    required this.description,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var bgBodyColor = Color(0xff3e98d0);

  String imagePath = 'assets/images/sun-cloud.png';

  @override
  void initState() {
    super.initState();

    // Set imagePath based on the mainData value
    switch (widget.mainData) {
      case 'Clouds':
        imagePath = 'assets/images/sun-cloud.png';
        bgBodyColor = Color(0xff3e98d0);
        break;
      case 'Rain':
        imagePath = 'assets/images/rainny.png';
        bgBodyColor = Color(0xff1b4d71);
        break;
      case 'Clear':
        imagePath = 'assets/images/sun.png';
        bgBodyColor = Color(0xff3e98d0);
        break;
      case 'Thunderstorm':
        imagePath = 'assets/images/hevyrain.png';
        bgBodyColor = Color(0xff3e98d0);
        break;
      default:
        imagePath = 'assets/images/sun.png';
        bgBodyColor = Color(0xff3e98d0); // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBodyColor,
      appBar: AppBar(
        title: Text(
          '${widget.locationName ?? "Unknown"}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
                children: [Image.asset(imagePath, height: 320)],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    '${widget.temperatureCelsius?.toStringAsFixed(0) ?? "--"}\u00B0',
                    style: const TextStyle(
                      fontSize: 82,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.mainData ?? "Clear"}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      'Humidity: ${widget.humidity ?? "--"}%  |  Wind: ${widget.windSpeed?.toStringAsFixed(1) ?? "--"} m/s',
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${widget.description ?? "Clear"}',
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Nim Bold',
                            ),
                          ),
                          Text(
                            'Weather is good so put on sunscreen 🌞 while in ${widget.locationName ?? "your city"}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontFamily: 'Nim Reg'),
                            maxLines: 3,
                          ),
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
