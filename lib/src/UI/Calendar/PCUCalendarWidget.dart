﻿import 'package:flutter/material.dart';
import 'WHUCalendarYMSelectView.dart';
import '../../Context/PCCContext.dart';
import '../../Business/Calendar/WHUCalendarCal.dart';
import '../../Business/Calendar/WHUCalendarItem.dart';
import '../Base/PCUDateButton.dart';
import '../Base/PCUDateTile.dart';
import '../Base/PCUInfoWidget.dart';
import 'PCUCalendarCell.dart';

import 'package:flutter/src/rendering/sliver_grid.dart';
import 'package:flutter/src/rendering/sliver.dart';

class PCUCalendarWidget extends StatefulWidget {
  PCUCalendarWidget({this.onChange, this.selectDate});
  final WHUCalendarCal calendarBusiness = WHUCalendarCal();
  final ValueChanged<WHUCalendarItem> onChange;
  final DateTime selectDate;

  @override
  State<StatefulWidget> createState() {
    return _PCUCalendarWidgetState();
  }
}

class _PCUCalendarWidgetState extends State<PCUCalendarWidget> {
  String _strMonth;
  String _strCurDate;
  Map _dataDic;

  @override
  void initState() {
    super.initState();
    _strCurDate = widget.calendarBusiness.currentDateStr();
    _dataDic = widget.calendarBusiness.loadDataWith(_strCurDate);

    _strMonth = _dataDic['monthStr'];
    setState(() {});
  }

  List<Widget> dayItems(double widgetHeight) {
    List days = [];
    if (null != _dataDic) days = _dataDic['dataArr'];
    List dayWidgets = days.map((value) {
      PCUCalendarCell cell = PCUCalendarCell(widgetHeight);
      // cell.rowIndex = 1;
      // cell.total = days.length;
      WHUCalendarItem dateItem = value as WHUCalendarItem;
      if (null != dateItem.holiday)
        cell.dbl = dateItem.holiday;
      else
        cell.dbl = dateItem.chineseCalendar;

      if (dateItem.dateStr == _strCurDate)
        cell.isToday = true;
      else
        cell.isToday = false;

      if (dateItem.day < 0) {
        cell.lbl = '${-dateItem.day}';
        cell.isDayInCurMonth = false;
      } else {
        cell.lbl = '${dateItem.day}';
        cell.isDayInCurMonth = true;
      }
      cell.dateItem = dateItem;
      cell.onChange = widget.onChange;
      return cell;
    }).toList();
    return dayWidgets;
  }

  Widget getWidget(BuildContext context) {
    double gridWidget = PCCContext.scale(300, context);
    double itemHeight = gridWidget / 7;
    List list = dayItems(itemHeight);
    int nRowCount = list.length > 35 ? 6 : 5;
    return Container(
      height: gridWidget + 1 + 10 + 100,
      width: gridWidget + 1 + 30,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                PCUDateButton('<上一月', () {}),
                Expanded(
                  child: Center(
                    child: PCUDateTile(null == _strMonth ? '日期' : _strMonth),
                  ),
                ),
                PCUDateButton('下一月>', () {}),
              ],
            ),
          ),
          //Expanded(
          // child:
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              height: itemHeight * nRowCount,
              width: gridWidget + 1,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 1, top: 1, bottom: 1),
                child: GridView.custom(
                  shrinkWrap: true,
                  gridDelegate: _DayPickerGridDelegate(
                    mainAxisNumber: nRowCount,
                    widgetHeight: itemHeight,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  childrenDelegate: SliverChildListDelegate(list,
                      addRepaintBoundaries: false),
                ),
              ),
            ),
          ),
          // ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: PCUInfoWidget('1.向左滑动,跳转到上一月,向右滑动,跳转到下一月.'),
            ),
          ),
          Padding(
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
    return getWidget(context);
  }
}

/// 自定义GridView
class _DayPickerGridDelegate extends SliverGridDelegate {
  final int mainAxisNumber;
  final double widgetHeight;
  const _DayPickerGridDelegate({
    this.mainAxisNumber,
    this.widgetHeight,
  });
  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    const int columnCount = DateTime.daysPerWeek;
    return SliverGridRegularTileLayout(
      crossAxisCount: columnCount,
      mainAxisStride: widgetHeight,
      crossAxisStride: widgetHeight,
      childMainAxisExtent: widgetHeight - 1,
      childCrossAxisExtent: widgetHeight - 1,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(SliverGridDelegate oldDelegate) {
    return false;
  }
}

const _DayPickerGridDelegate _kDayPickerGridDelegate = _DayPickerGridDelegate();