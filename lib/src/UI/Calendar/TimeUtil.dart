import 'package:flutter/cupertino.dart';
// import 'package:flutter_xiaoe/utils/ScreenUtil.dart';
// import 'package:flutter_xiaoe/utils/NetUtil.dart';
// import 'package:flutter_xiaoe/config/Api.dart';
// import 'package:flutter_xiaoe/config/Colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_xiaoe/widgets/login/ImageInputWidget.dart';
// import 'package:flutter_xiaoe/config/Constant.dart';
// import 'package:flutter_xiaoe/config/ImageConfig.dart';
// import 'package:flutter_xiaoe/widgets/common/ShadowContainer.dart';
// import 'package:flutter_xiaoe/widgets/login/GradientButton.dart';
// import 'package:flutter_xiaoe/widgets/common/Header.dart';
import '../../Context/PCCContext.dart';

class TimeUtil {
  static const List<int> _daysInMonth = <int>[
    31,
    -1,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

  /// 获取这个月的天数
  static int getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      if (isLeapYear) return 29;
      return 28;
    }
    return _daysInMonth[month - 1];
  }

  /// 获取周Header
  static List<Widget> getDayHeaders(MaterialLocalizations localizations) {
    List<Widget> list = [];
    for (int i = localizations.firstDayOfWeekIndex; true; i = (i + 1) % 7) {
      final String weekday = localizations.narrowWeekdays[i];
      list.add(Flexible(
          child: Container(
        height: PCCContext.px2pt(80),
        child: Center(
          child: Text(
            weekday,
            style: TextStyle(
              color: Colors.black12,
              fontSize: PCCContext.px2ptFont(34),
            ),
          ),
        ),
      )));
      if (i == (localizations.firstDayOfWeekIndex - 1) % 7) break;
    }
    return list;
  }

  /// 得到这个月的第一天是星期几（0 是 星期日 1 是 星期一...）
  static int computeFirstDayOffset(
      int year, int month, MaterialLocalizations localizations) {
    // 0-based day of week, with 0 representing Monday.
    final int weekdayFromMonday = DateTime(year, month).weekday - 1;
    // 0-based day of week, with 0 representing Sunday.
    final int firstDayOfWeekFromSunday = localizations.firstDayOfWeekIndex;
    // firstDayOfWeekFromSunday recomputed to be Monday-based
    final int firstDayOfWeekFromMonday = (firstDayOfWeekFromSunday - 1) % 7;
    // Number of days between the first day of week appearing on the calendar,
    // and the day corresponding to the 1-st of the month.
    return (weekdayFromMonday - firstDayOfWeekFromMonday) % 7;
  }

  /// 获取天
  static List getDay(int year, int month, MaterialLocalizations localizations) {
    List labels = [];
    final int daysInMonth = getDaysInMonth(year, month);
    final int firstDayOffset =
        computeFirstDayOffset(year, month, localizations);
    for (int i = 0; true; i += 1) {
      // 1-based day of month, e.g. 1-31 for January, and 1-29 for February on
      // a leap year.
      final int day = i - firstDayOffset + 1;
      if (day > daysInMonth) break;
      if (day < 1) {
        labels.add(0);
      } else {
        labels.add(DateTime(year, month, day));
      }
    }
    return labels;
  }
}
