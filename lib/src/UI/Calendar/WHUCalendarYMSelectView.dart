import 'package:flutter/material.dart';

class WHUCalendarYMSelectView extends StatefulWidget {
  WHUCalendarYMSelectView(this.selectdDateStr);
  final String selectdDateStr;
  @override
  State<StatefulWidget> createState() {
    return _WHUCalendarYMSelectViewState();
  }
}

class _WHUCalendarYMSelectViewState extends State<WHUCalendarYMSelectView> {
  @override
  Widget build(BuildContext context) {
    return Text('data');
  }
}
