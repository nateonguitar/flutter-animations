import 'dart:math';

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
  Color _targetBoxColor = Colors.green;
  double _targetAngle = pi * 2;

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
            _curvePicker(),
            _colorChangeBox(),
            _spinningIcon(),
          ],
        ),
      ),
    );
  }

  Widget _curvePicker() {
    return DropdownButton(
      value: _selectedCurve,
      items: CurveListItem.curves.map((CurveListItem c) {
        return DropdownMenuItem(
          child: Text(c.label),
          value: c.value,
        );
      }).toList(),
      onChanged: (Curve value) {
        _selectedCurve = value;
        setState(() {});
      },
    );
  }

  Widget _colorChangeBox() {
    return TweenAnimationBuilder<Color>(
      curve: _selectedCurve,
      onEnd: () {
        if (_targetBoxColor == Colors.green) {
          _targetBoxColor = Colors.yellow;
        } else if (_targetBoxColor == Colors.yellow) {
          _targetBoxColor = Colors.blue;
        } else if (_targetBoxColor == Colors.blue) {
          _targetBoxColor = Colors.red;
        } else {
          _targetBoxColor = Colors.green;
        }
        setState(() {});
      },
      tween: ColorTween(
        begin: Colors.red,
        end: _targetBoxColor,
      ),
      duration: Duration(milliseconds: 1500),
      builder: (BuildContext _, Color animatedColor, Widget __) {
        return Container(
          width: 50,
          height: 50,
          color: animatedColor,
        );
      },
    );
  }

  Widget _spinningIcon() {
    return TweenAnimationBuilder<double>(
      curve: _selectedCurve,
      duration: Duration(milliseconds: 2000),
      onEnd: () {
        _targetAngle = _targetAngle == 0 ? pi * 2 : 0;
        setState(() {});
      },
      tween: Tween(
        begin: 0,
        end: _targetAngle,
      ),
      builder: (BuildContext _, double animatedAngle, Widget __) {
        return Transform.rotate(
          angle: animatedAngle,
          child: Icon(
            Icons.ac_unit,
            size: 50,
          ),
        );
      },
    );
  }
}
