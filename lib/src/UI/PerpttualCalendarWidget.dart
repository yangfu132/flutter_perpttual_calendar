import 'package:flutter/material.dart';

class PerpttualCalendarWidget extends StatefulWidget {
  @override
  PerpttualCalendarWidgetState createState() {
    return PerpttualCalendarWidgetState();
  }
}

class PerpttualCalendarWidgetState extends State<PerpttualCalendarWidget> {
  Color _defaultColor = Color(0xFF6F6F6F);

  @override
  Widget build(BuildContext context) {
    return Text(
      'data',
      style: TextStyle(color: _defaultColor),
    );
  }
}
