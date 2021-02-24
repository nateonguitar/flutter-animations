import 'package:flutter/material.dart';

import 'pages/implicit.dart';
import 'pages/landing.dart';
import 'pages/tween.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingPage(),
      routes: {
        ImplicitPage.route: (context) => ImplicitPage(),
        TweenPage.route: (context) => TweenPage(),
      }
    );
  }
}

