import 'package:flutter/material.dart';

class WHUCalendarYMSelectView extends StatefulWidget {
  const WHUCalendarYMSelectView(this.selectdDateStr, {super.key});
  final String selectdDateStr;
  @override
  State<StatefulWidget> createState() {
    return _WHUCalendarYMSelectViewState();
  }
}

class _WHUCalendarYMSelectViewState extends State<WHUCalendarYMSelectView> {
  @override
  Widget build(BuildContext context) {
    return const Text('data');
  }
}
