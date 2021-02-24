import 'package:FlutterAnimations/utils/curve_list_item.dart';
import 'package:flutter/material.dart';


class TweenPage extends StatefulWidget {
  static String route = 'tween';

  TweenPage({Key key}) : super(key: key);

  @override
  _TweenPageState createState() => _TweenPageState();
}

class _TweenPageState extends State<TweenPage> {

  Curve _selectedCurve = Curves.linear;

  @override
  void initState() {
    if (_selectedCurve == null) {
      _selectedCurve = CurveListItem.curves[0].value;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Tween"),
      ),
      body: Container(
        width: screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('tween'),
          ],
        ),
      ),
    );
  }
}
