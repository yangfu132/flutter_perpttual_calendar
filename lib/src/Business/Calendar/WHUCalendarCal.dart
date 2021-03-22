import '../../Service/PWSDateTimeService.dart';
import 'WHUCalendarItem.dart';
import '../PerpttualCalendar/PWBCalendarBusiness.dart';

class WHUCalendarCal {
  WHUCalendarCal({this.curDateStr});
  String curDateStr;
  Map _preCalMap;
  Map _nextCalMap;
  Map _currentCalMap;

  String currentDateStr() {
    if (null == curDateStr) {
      this.curDateStr =
          PWSDateTimeService.stringFromDate(DateTime.now(), 'yyyy-MM-dd');
    }
    return this.curDateStr;
  }

  Map loadDataWith(String dateStr) {
    DateTime dateTime = PWSDateTimeService.dateFromString(dateStr);
    String strMonth = PWSDateTimeService.stringFromDate(dateTime, 'yyyy年MM月');
    this._currentCalMap =
        calendarMapWith(PWSDateTimeService.dateFromString(dateStr));
    if (this._preCalMap == null) {
      this._preCalMap = getPreCalendarMap(strMonth);
    }
    if (this._nextCalMap == null) {
      this._nextCalMap = getNextCalendarMap(strMonth);
    }
    return _currentCalMap;
  }

  void getCalendarMapWithCallBack(
      String dateStr, void Function(Map dic) completeBlk) {
    String nextMonthStr = nextMonthOfMonthString(dateStr);
    String preMonthStr = preMonthOfMonthString(dateStr);
    if (this._preCalMap != null && (this._preCalMap["monthStr"] == dateStr)) {
      Map tempCur = this._currentCalMap;
      this._currentCalMap = this._preCalMap;
      completeBlk(this._currentCalMap);
      if (tempCur != null && (tempCur["monthStr"] == nextMonthStr)) {
        this._nextCalMap = tempCur;
      } else {
        this._nextCalMap = null;
      }
      this._preCalMap = null;
    } else if (this._nextCalMap != null &&
        (this._nextCalMap["monthStr"] == dateStr)) {
      Map tempCur = this._currentCalMap;
      this._currentCalMap = this._nextCalMap;
      completeBlk(this._currentCalMap);
      if (tempCur != null && (tempCur["monthStr"] == preMonthStr)) {
        this._preCalMap = tempCur;
      } else {
        this._preCalMap = null;
      }
      this._nextCalMap = null;
    } else {
      if (this._currentCalMap["monthStr"] == dateStr) {
        completeBlk(this._currentCalMap);
      } else {
        this._currentCalMap =
            calendarMapWith(PWSDateTimeService.dateFromMonthString(dateStr));
        completeBlk(this._currentCalMap);
      }
      this._nextCalMap = null;
      this._preCalMap = null;
    }

    if (this._preCalMap == null) {
      this._preCalMap = getPreCalendarMap(dateStr);
    }

    if (this._nextCalMap == null) {
      this._nextCalMap = getNextCalendarMap(dateStr);
    }
  }

  Map calendarMapWith(DateTime date) {
    Map mdic = {};
    List dateArr = [];

    //如果这个月的第一天不是星期一，需要在前面补充天数
    DateTime firstDayOfMonth = getFirstDayOfMonth(date);
    if (firstDayOfMonth.weekday != 1) {
      int weekGap = firstDayOfMonth.weekday - 1;
      if (weekGap < 0) weekGap += 7;
      for (int i = 0; i < weekGap; i++) {
        DateTime theDate =
            firstDayOfMonth.add(new Duration(days: -weekGap + i));
        WHUCalendarItem item = WHUCalendarItem();
        item.dateStr = PWSDateTimeService.stringFromDate(theDate, 'yyyy-MM-dd');
        item.day = -theDate.day;
        // lunarForSolarYear(item, theDate);
        dateArr.add(item);
      }
    }
    //将本月的所有天数变为文本
    mdic['monthStr'] = PWSDateTimeService.stringFromDate(date, 'yyyy年MM月');
    int days = getDaysInMonth(date.year, date.month);
    for (int i = 0; i < days; i++) {
      WHUCalendarItem item = WHUCalendarItem();
      DateTime theDate = firstDayOfMonth.add(new Duration(days: i));
      item.dateStr = PWSDateTimeService.stringFromDate(theDate, 'yyyy-MM-dd');
      item.day = theDate.day;
      // lunarForSolarYear(item, theDate);
      dateArr.add(item);
    }

    //如果结尾不是星期天需要在末尾补充天数

    DateTime lastDayOfMonth = getLastDayOfMonth(date);
    if (lastDayOfMonth.weekday != 7) {
      int weekGap = 8 - lastDayOfMonth.weekday;
      for (int i = 1; i < weekGap; i++) {
        DateTime theDate = firstDayOfMonth.add(new Duration(days: i));
        WHUCalendarItem item = WHUCalendarItem();
        item.dateStr = PWSDateTimeService.stringFromDate(theDate, 'yyyy-MM-dd');
        item.day = -i;
        // lunarForSolarYear(item, theDate);
        dateArr.add(item);
      }
    }
    mdic['dataArr'] = dateArr;
    return mdic;
  }

  Map getCalendarMapWith(String dateStr) {
    DateTime date = DateTime.parse(dateStr);
    return calendarMapWith(date);
  }

  void preMonthCalendar(String dateStr, void Function(Map) completionBlk) {
    String preMonthStr = preMonthOfMonthString(dateStr);
    getCalendarMapWithCallBack(preMonthStr, completionBlk);
  }

  void nextMonthCalendar(String dateStr, void Function(Map) completionBlk) {
    String nextMonthStr = nextMonthOfMonthString(dateStr);
    getCalendarMapWithCallBack(nextMonthStr, completionBlk);
  }

  Map getPreCalendarMap(String dateStr) {
    DateTime date = PWSDateTimeService.dateFromMonthString(dateStr);
    return calendarMapWith(getPreMonth(date));
  }

  Map getNextCalendarMap(String dateStr) {
    DateTime date = PWSDateTimeService.dateFromMonthString(dateStr);
    return calendarMapWith(getLastMonth(date));
  }

  String preMonthOfMonthString(String dateStr) {
    DateTime date = PWSDateTimeService.dateFromMonthString(dateStr);
    DateTime preDate = getPreMonth(date);
    return PWSDateTimeService.stringFromDate(preDate, 'yyyy年MM月');
  }

  String nextMonthOfMonthString(String dateStr) {
    DateTime date = PWSDateTimeService.dateFromMonthString(dateStr);
    DateTime preDate = getLastMonth(date);
    return PWSDateTimeService.stringFromDate(preDate, 'yyyy年MM月');
  }

  // lunarForSolarYear(WHUCalendarItem calendarDay, DateTime theDate) {
  //   String solarYear = PWBCalendarBusiness.lunarForSolarYear(theDate);
  //   List solarYear_arr = solarYear.split('-');
  //   if (solarYear_arr[0] == "正" && solarYear_arr[1] == "初一") {
  //     //正月初一：春节
  //     calendarDay.holiday = "春节";
  //   } else if (solarYear_arr[0] == "正" && solarYear_arr[1] == "十五") {
  //     //正月十五：元宵节
  //     calendarDay.holiday = "元宵";
  //   } else if (solarYear_arr[0] == "二" && solarYear_arr[1] == "初二") {
  //     //二月初二：春龙节(龙抬头)
  //     calendarDay.holiday = "龙抬头";
  //   } else if (solarYear_arr[0] == "五" && solarYear_arr[1] == "初五") {
  //     //五月初五：端午节
  //     calendarDay.holiday = "端午";
  //   } else if (solarYear_arr[0] == "七" && solarYear_arr[1] == "初七") {
  //     //七月初七：七夕情人节
  //     calendarDay.holiday = "七夕";
  //   } else if (solarYear_arr[0] == "八" && solarYear_arr[1] == "十五") {
  //     //八月十五：中秋节
  //     calendarDay.holiday = "中秋";
  //   } else if (solarYear_arr[0] == "九" && solarYear_arr[1] == "初九") {
  //     //九月初九：重阳节、中国老年节（义务助老活动日）
  //     calendarDay.holiday = "重阳";
  //   } else if (solarYear_arr[0] == "腊" && solarYear_arr[1] == "初八") {
  //     //腊月初八：腊八节
  //     calendarDay.holiday = "腊八";
  //   } else if (solarYear_arr[0] == "腊" && solarYear_arr[1] == "二十四") {
  //     //腊月二十四 小年
  //     calendarDay.holiday = "小年";
  //   } else if (solarYear_arr[0] == "腊" && solarYear_arr[1] == "三十") {
  //     //腊月三十（小月二十九）：除夕
  //     calendarDay.holiday = "除夕";
  //   }

  //   calendarDay.chineseCalendar = solarYear_arr[1];

  //   String commonHoliday = getCommonHoliday(theDate);
  //   if (commonHoliday != null) {
  //     calendarDay.holiday = commonHoliday;
  //   }
  // }

  String getCommonHoliday(DateTime calendarDay) {
    if (calendarDay.month == 1 && calendarDay.day == 1) {
      return "元旦";

      //2.14情人节
    } else if (calendarDay.month == 2 && calendarDay.day == 14) {
      return "情人节";

      //3.8妇女节
    } else if (calendarDay.month == 3 && calendarDay.day == 8) {
      return "妇女节";

      //5.1劳动节
    } else if (calendarDay.month == 5 && calendarDay.day == 1) {
      return "劳动节";

      //6.1儿童节
    } else if (calendarDay.month == 6 && calendarDay.day == 1) {
      return "儿童节";

      //8.1建军节
    } else if (calendarDay.month == 8 && calendarDay.day == 1) {
      return "建军节";

      //9.10教师节
    } else if (calendarDay.month == 9 && calendarDay.day == 10) {
      return "教师节";

      //10.1国庆节
    } else if (calendarDay.month == 10 && calendarDay.day == 1) {
      return "国庆节";

      //11.1植树节
    } else if (calendarDay.month == 3 && calendarDay.day == 12) {
      return "植树节";

      //11.11光棍节
    } else if (calendarDay.month == 11 && calendarDay.day == 11) {
      return "光棍节";
    }
    return null;
  }

//新增加方法--------------------------------------------------------------------------

  //方法注释：获得当前月的第一天
  DateTime getFirstDayOfMonth(DateTime date) {
    DateTime localDate = date.toLocal();
    return DateTime.utc(localDate.year, localDate.month, 1);
  }

  DateTime getLastDayOfMonth(DateTime date) {
    DateTime firstDate = getFirstDayOfMonth(date);
    return firstDate
        .add(new Duration(days: getDaysInMonth(date.year, date.month) - 1));
  }

  DateTime getPreMonth(DateTime date) {
    int year = date.year;
    int month = date.month;

    month -= 1;
    if (month <= 0) {
      month += 12;
      year -= 1;
    }
    return DateTime(year, month, 1);
  }

  DateTime getLastMonth(DateTime date) {
    int year = date.year;
    int month = date.month;

    month += 1;
    if (month > 12) {
      month -= 12;
      year += 1;
    }
    return DateTime(year, month, 1);
  }

//常量--------------------------------------------------------------------------

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
}
