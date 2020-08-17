import 'package:flutter/material.dart';
import 'TimeUtil.dart';
import '../../Context/PCCContext.dart';

class DayGridView extends StatefulWidget {
  int year;
  int month;
  @override
  State<DayGridView> createState() => _DayGridViewState();
}

class _DayGridViewState extends State<DayGridView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List days = TimeUtil.getDay(
        widget.year, widget.month, MaterialLocalizations.of(context));
    return Text('data');
  }
}
