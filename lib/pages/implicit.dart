import 'package:FlutterAnimations/utils/curve_list_item.dart';
import 'package:flutter/material.dart';


class ImplicitPage extends StatefulWidget {
  static String route = 'implicit';

  ImplicitPage({Key key}) : super(key: key);

  @override
  _ImplicitPageState createState() => _ImplicitPageState();
}

class _ImplicitPageState extends State<ImplicitPage> {

  Curve _selectedCurve = Curves.linear;
  bool _wideBox = false;

  Map<String, bool> _passwordValidations = {
    'length': false,
    'special_char': false,
    'number': false,
  };

  TextEditingController _textEditingController;

  @override
  void initState() {
    if (_selectedCurve == null) {
      _selectedCurve = CurveListItem.curves[0].value;
    }
    if (_textEditingController == null) {
       _textEditingController = TextEditingController();
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
          mainAxisSize: MainAxisSize.min,
          children: [
            _curvePicker(),
            _growWideContainer(screenSize),
            _passwordStrengthChecker(),
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

  Widget _growWideContainer(Size screenSize) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: _selectedCurve,
        color: Colors.blue[200],
        height: 50,
        width: _wideBox ? 50 : screenSize.width - 50,
        child: Center(child: Text('Grow Wide')),
      ),
      onTap: () {
        _wideBox = !_wideBox;
        setState(() {});
      },
    );
  }

  Widget _passwordStrengthChecker() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.yellow[100],
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  offset: Offset(1, 1),
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _animatedValidation(label: "8 or More Characters", validationKey: 'length'),
                  _animatedValidation(label: "1 Special Character", validationKey: 'special_char'),
                  _animatedValidation(label: "1 Number", validationKey: 'number'),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextFormField(
            controller: _textEditingController,
            onChanged: (String value) {
              RegExp specialCharRegex = RegExp(r"[@$!%*#?&]");
              RegExp numberRegex = RegExp(r"[0-9]");
              _passwordValidations['length'] = value.length >= 8;
              _passwordValidations['special_char'] = specialCharRegex.hasMatch(value);
              _passwordValidations['number'] = numberRegex.hasMatch(value);
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget _animatedValidation({@required String label, @required String validationKey, int milliseconds = 750}) {
    const Color _crossoutColor = const Color(0xAAFF0000);
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('- $label'),
          ),
          Positioned(
            top: 15,
            left: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: milliseconds),
              curve: _selectedCurve,
              color: _crossoutColor,
              height: 2,
              width: _passwordValidations[validationKey] ? 200 : 0,
            ),
          ),
        ],
      ),
    );
  }
}
