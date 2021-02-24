import 'package:flutter/material.dart';

class CurveListItem {
  final String label;
  final Curve value;
  CurveListItem(this.label, this.value);
}

class ImplicitPage extends StatefulWidget {
  static String route = 'implicit';

  ImplicitPage({Key key}) : super(key: key);

  @override
  _ImplicitPageState createState() => _ImplicitPageState();
}

class _ImplicitPageState extends State<ImplicitPage> {

  List<CurveListItem> _curves = [
    CurveListItem('Curves.bounceIn', Curves.bounceIn),
    CurveListItem('Curves.bounceInOut', Curves.bounceInOut),
    CurveListItem('Curves.bounceOut', Curves.bounceOut),
    CurveListItem('Curves.decelerate', Curves.decelerate),
    CurveListItem('Curves.ease', Curves.ease),
    CurveListItem('Curves.easeIn', Curves.easeIn),
    CurveListItem('Curves.easeInBack', Curves.easeInBack),
    CurveListItem('Curves.easeInCirc', Curves.easeInCirc),
    CurveListItem('Curves.easeInCubic', Curves.easeInCubic),
    CurveListItem('Curves.easeInExpo', Curves.easeInExpo),
    CurveListItem('Curves.easeInOut', Curves.easeInOut),
    CurveListItem('Curves.easeInOutBack', Curves.easeInOutBack),
    CurveListItem('Curves.easeInOutCirc', Curves.easeInOutCirc),
    CurveListItem('Curves.easeInOutCubic', Curves.easeInOutCubic),
    CurveListItem('Curves.easeInOutExpo', Curves.easeInOutExpo),
    CurveListItem('Curves.easeInOutQuad', Curves.easeInOutQuad),
    CurveListItem('Curves.easeInOutQuart', Curves.easeInOutQuart),
    CurveListItem('Curves.easeInOutQuint', Curves.easeInOutQuint),
    CurveListItem('Curves.easeInOutSine', Curves.easeInOutSine),
    CurveListItem('Curves.easeInQuad', Curves.easeInQuad),
    CurveListItem('Curves.easeInQuart', Curves.easeInQuart),
    CurveListItem('Curves.easeInQuint', Curves.easeInQuint),
    CurveListItem('Curves.easeInSine', Curves.easeInSine),
    CurveListItem('Curves.easeInToLinear', Curves.easeInToLinear),
    CurveListItem('Curves.easeOut', Curves.easeOut),
    CurveListItem('Curves.easeOutBack', Curves.easeOutBack),
    CurveListItem('Curves.easeOutCirc', Curves.easeOutCirc),
    CurveListItem('Curves.easeOutCubic', Curves.easeOutCubic),
    CurveListItem('Curves.easeOutExpo', Curves.easeOutExpo),
    CurveListItem('Curves.easeOutQuad', Curves.easeOutQuad),
    CurveListItem('Curves.easeOutQuart', Curves.easeOutQuart),
    CurveListItem('Curves.easeOutQuint', Curves.easeOutQuint),
    CurveListItem('Curves.easeOutSine', Curves.easeOutSine),
    CurveListItem('Curves.elasticIn', Curves.elasticIn),
    CurveListItem('Curves.elasticInOut', Curves.elasticInOut),
    CurveListItem('Curves.elasticOut', Curves.elasticOut),
    CurveListItem('Curves.fastLinearToSlowEaseIn', Curves.fastLinearToSlowEaseIn),
    CurveListItem('Curves.fastOutSlowIn', Curves.fastOutSlowIn),
    CurveListItem('Curves.linear', Curves.linear),
    CurveListItem('Curves.linearToEaseOut', Curves.linearToEaseOut),
    CurveListItem('Curves.slowMiddle', Curves.slowMiddle),

  ];

  Curve _selectedCurve = Curves.linear;
  bool _wideBox = false;

  @override
  void initState() {
    if (_selectedCurve == null) {
      _selectedCurve = _curves[0].value;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Implicit"),
      ),
      body: Container(
        width: screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropdownButton(
              value: _selectedCurve,
              items: _curves.map((CurveListItem c) {
                return DropdownMenuItem(
                  child: Text(c.label),
                  value: c.value,
                );
              }).toList(),
              onChanged: (Curve value) {
                _selectedCurve = value;
                setState(() {});
              },
            ),
            GestureDetector(
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: _selectedCurve,
                color: Colors.blue[200],
                height: 50,
                width: _wideBox ? 50 : 150,
                child: Center(child: Text('Grow Wide')),
              ),
              onTap: () {
                _wideBox = !_wideBox;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
