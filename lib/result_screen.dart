import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  // const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  // properties and methods

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Text('data'),
        ],
      ),
    );
  }
}