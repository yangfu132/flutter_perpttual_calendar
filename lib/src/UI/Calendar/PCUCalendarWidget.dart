import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_perpttual_calendar/src/Business/Calendar/WHUCalendarItem.dart';

import '../../Business/Calendar/WHUCalendarCal.dart';
// import '../../Business/Calendar/WHUCalendarItem.dart';
import '../../Context/PCCContext.dart';
import '../Base/PCUDateButton.dart';
import '../Base/PCUDateTile.dart';
import '../Base/PCUInfoWidget.dart';
import 'PCUCalendarGridView.dart';

class PCUCalendarWidget extends StatefulWidget {
  PCUCalendarWidget({super.key, this.onChange, this.selectDate});
  final WHUCalendarCal calendarBusiness = WHUCalendarCal();
  final ValueChanged<WHUCalendarItem?>? onChange;
  final DateTime? selectDate;

  @override
  State<StatefulWidget> createState() {
    return _PCUCalendarWidgetState();
  }
}

class _PCUCalendarWidgetState extends State<PCUCalendarWidget> {
  String? _strMonth;
  String? _strCurDate;
  Map? _dataDic;

  @override
  void initState() {
    super.initState();
    _strCurDate = widget.calendarBusiness.currentDateStr();
    _dataDic = widget.calendarBusiness.loadDataWith(_strCurDate!);

    _strMonth = _dataDic!['monthStr'];
    setState(() {});
  }

  Widget getWidget(BuildContext context) {
    double gridWidget = PCCContext.scale(300, context);
    return SizedBox(
      height: gridWidget + 1 + 10 + 100,
      width: gridWidget + 1 + 30,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                PCUDateButton('<上一月', _onPreMonthClicked),
                Expanded(
                  child: Center(
                    child: PCUDateTile(null == _strMonth ? '日期' : _strMonth!),
                  ),
                ),
                PCUDateButton('下一月>', _onNextMonthClicked),
              ],
            ),
          ),
          //Expanded(
          // child:
          Padding(
              padding: const EdgeInsets.all(15),
              child: PCUCalendarGridView(
                dataDic: _dataDic,
                gridWidget: gridWidget,
                onChange: widget.onChange,
              )),
          // ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: PCUInfoWidget('1.向左滑动,跳转到上一月,向右滑动,跳转到下一月.'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: PCUInfoWidget('2.向下滑动可以跳转到选择年份月份界面.'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double left = 0.0; //距左边的偏移
    double angle = 0;
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.red),
      child: Transform.rotate(
        //旋转90度
        angle: angle,
        child: GestureDetector(
          child: getWidget(context),
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            left += details.delta.dx;
          },
          onHorizontalDragEnd: (DragEndDetails details) {
            if (left > 10) {
              _onPreMonthClicked();
            }
            if (left < -10) {
              _onNextMonthClicked();
            }
            left = 0;
          },
          onHorizontalDragCancel: () {
            left = 0;
          },
          onVerticalDragCancel: () {},
          onVerticalDragEnd: (details) {
            angle = pi / 2;
            setState(() {});
          },
        ),
      ),
    );
  }

  void _onPreMonthClicked() {
    widget.calendarBusiness.preMonthCalendar(_strMonth!, (Map? mapDate) {
      _dataDic = mapDate;
      _strMonth = _dataDic!['monthStr'];
      setState(() {});
    });
  }

  void _onNextMonthClicked() {
    widget.calendarBusiness.nextMonthCalendar(_strMonth!, (Map? mapDate) {
      _dataDic = mapDate;
      _strMonth = _dataDic!['monthStr'];
      setState(() {});
    });
  }
}
