import 'package:flutter/material.dart';

import 'implicit.dart';
import 'tween.dart';

class LandingPage extends StatefulWidget {
  static String route = 'landing';

  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    const Widget chevron = const Icon(Icons.chevron_right);
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: ListTile(
                leading: const Icon(Icons.animation),
                title: const Text('Implicit Animations'),
                trailing: chevron,
              ),
              onTap: () {
                Navigator.pushNamed(context, ImplicitPage.route);
              },
            ),
            GestureDetector(
              child: ListTile(
                leading: const Icon(Icons.adjust_outlined),
                title: const Text('Tween Animations'),
                trailing: chevron,
              ),
              onTap: () {
                Navigator.pushNamed(context, TweenPage.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}