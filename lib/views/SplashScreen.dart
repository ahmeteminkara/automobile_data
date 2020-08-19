import 'dart:async';

import 'package:automobile_data/views/HomeView.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => HomeView())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
          child: Image.asset(
        "assets/automobile_data_logo.png",
        color: Colors.white,
        fit: BoxFit.contain,
        height: MediaQuery.of(context).size.width * 0.4,
        width: MediaQuery.of(context).size.width * 0.4,
      )),
    );
  }
}
