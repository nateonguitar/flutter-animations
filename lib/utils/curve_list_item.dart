
import 'package:flutter/material.dart';

class CurveListItem {
  static List<CurveListItem> curves = [
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
  final String label;
  final Curve value;
  CurveListItem(this.label, this.value);
}
