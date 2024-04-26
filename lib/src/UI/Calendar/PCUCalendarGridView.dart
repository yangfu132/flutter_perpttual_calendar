import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver.dart';
import 'package:flutter/src/rendering/sliver_grid.dart';
import 'package:flutter_perpttual_calendar/src/Business/Calendar/WHUCalendarItem.dart';

import '../../Business/Calendar/WHUCalendarCal.dart';
// import '../../Business/Calendar/WHUCalendarItem.dart';
import 'PCUCalendarCell.dart';

class PCUCalendarGridView extends StatefulWidget {
  PCUCalendarGridView({super.key, 
    required this.gridWidget,
    this.dataDic,
    this.strCurDate,
    this.onChange,
  });
  final WHUCalendarCal calendarBusiness = WHUCalendarCal();
  final ValueChanged<WHUCalendarItem?>? onChange;
  final String? strCurDate;
  final Map? dataDic;
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
    List? days = [];
    if (null != widget.dataDic) days = widget.dataDic!['dataArr'];
    List dayWidgets = days!.map((value) {
      WHUCalendarItem dateItem = value as WHUCalendarItem;
      PCUCalendarCell cell = PCUCalendarCell(widgetHeight,
          lbl:dateItem.day < 0 ? '${-dateItem.day}' : '${dateItem.day}',
          dbl:dateItem.holiday ?? dateItem.chineseCalendar,
          isToday:dateItem.dateStr == widget.strCurDate,
          isDayInCurMonth:dateItem.day >= 0,
          dateItem:dateItem,
          onChange:widget.onChange
      );
      // cell.rowIndex = 1;
      // cell.total = days.length;


      // if (dateItem.day < 0) {
      //   cell.lbl = '${-dateItem.day}';
      //   cell.isDayInCurMonth = false;
      // } else {
      //   cell.lbl = '${dateItem.day}';
      //   cell.isDayInCurMonth = true;
      // }
      // cell.dateItem = dateItem;
      // cell.onChange = widget.onChange;
      return cell;
    }).toList();
    return dayWidgets as List<Widget>;
  }

  @override
  Widget build(BuildContext context) {
    double itemHeight = widget.gridWidget / 7;
    List list = dayItems(itemHeight);
    int nRowCount = list.length > 35 ? 6 : 5;
    return Container(
      height: itemHeight * nRowCount,
      width: widget.gridWidget + 1,
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 1, top: 1, bottom: 1),
        child: GridView.custom(
          shrinkWrap: true,
          gridDelegate: _DayPickerGridDelegate(
            mainAxisNumber: nRowCount,
            widgetHeight: itemHeight,
          ),
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          childrenDelegate: SliverChildListDelegate(list as List<Widget>,
              addRepaintBoundaries: false),
        ),
      ),
    );
  }
}

/// 自定义GridView
class _DayPickerGridDelegate extends SliverGridDelegate {
  final int? mainAxisNumber;
  final double? widgetHeight;
  const _DayPickerGridDelegate({
    this.mainAxisNumber,
    this.widgetHeight,
  });
  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    const int columnCount = DateTime.daysPerWeek;
    return SliverGridRegularTileLayout(
      crossAxisCount: columnCount,
      mainAxisStride: widgetHeight!,
      crossAxisStride: widgetHeight!,
      childMainAxisExtent: widgetHeight! - 1,
      childCrossAxisExtent: widgetHeight! - 1,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(SliverGridDelegate oldDelegate) {
    return false;
  }
}
