import 'package:flutter/material.dart';

class CovidTracker extends StatefulWidget {
  @override
  _CovidTrackerState createState() => _CovidTrackerState();
}

class _CovidTrackerState extends State<CovidTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Tracker'),
      ),
    );
  }
}
