
import 'package:flutter/material.dart';

class ImplicitPage extends StatefulWidget {
  static String route = 'implicit';

  ImplicitPage({Key key}) : super(key: key);

  @override
  _ImplicitPageState createState() => _ImplicitPageState();
}

class _ImplicitPageState extends State<ImplicitPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Implicit"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ],
        ),
      ),
    );
  }
}