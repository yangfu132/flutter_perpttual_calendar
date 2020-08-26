import 'package:flutter/material.dart';
import '../../Context/PCCContext.dart';
import '../../Business/Calendar/WHUCalendarCal.dart';
import '../../Business/Calendar/WHUCalendarItem.dart';

import 'PCUCalendarCell.dart';

import 'package:flutter/src/rendering/sliver_grid.dart';
import 'package:flutter/src/rendering/sliver.dart';

class PCUCalendarGridView extends StatefulWidget {
  PCUCalendarGridView({
    @required this.gridWidget,
    this.dataDic,
    this.strCurDate,
    this.onChange,
  });
  final WHUCalendarCal calendarBusiness = WHUCalendarCal();
  final ValueChanged<WHUCalendarItem> onChange;
  final String strCurDate;
  final Map dataDic;
  final double gridWidget;
  @override
  State<StatefulWidget> createState() {
    return _PCUCalendarWidgetState();
  }
}

class _PCUCalendarWidgetState extends State<PCUCalendarGridView> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  List<Widget> dayItems(double widgetHeight) {
    List days = [];
    if (null != widget.dataDic) days = widget.dataDic['dataArr'];
    List dayWidgets = days.map((value) {
      PCUCalendarCell cell = PCUCalendarCell(widgetHeight);
      // cell.rowIndex = 1;
      // cell.total = days.length;
      WHUCalendarItem dateItem = value as WHUCalendarItem;
      if (null != dateItem.holiday)
        cell.dbl = dateItem.holiday;
      else
        cell.dbl = dateItem.chineseCalendar;

      if (dateItem.dateStr == widget.strCurDate)
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

  @override
  Widget build(BuildContext context) {
    double itemHeight = widget.gridWidget / 7;
    List list = dayItems(itemHeight);
    int nRowCount = list.length > 35 ? 6 : 5;
    return Container(
      height: itemHeight * nRowCount,
      width: widget.gridWidget + 1,
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
          childrenDelegate:
              SliverChildListDelegate(list, addRepaintBoundaries: false),
        ),
      ),
    );
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
