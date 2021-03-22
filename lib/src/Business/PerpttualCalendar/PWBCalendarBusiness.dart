import 'PWBSkyTrunkModel.dart';
import 'PWBSolarTermModel.dart';
import 'dart:math';
import 'PWBEarthBranchModel.dart';
import 'PWBTenGodModel.dart';
// import 'package lunar_solar_converter.dart';
// import 'package:lunar_calendar_converter/lunar_solar_converter.dart';

//类注释：万年历业务逻辑
class PWBCalendarBusiness {
  PWBCalendarBusiness(DateTime theDate) {
    this.theDate = theDate.toLocal();
    this.solarTerms = computeSolarTerm(this.theDate.month);
  }
  //属性注释：日期对象
  DateTime theDate;

  //属性注释：当年节气
  List<PWBSolarTermModel> solarTerms;

// 公曆
  String stringFromDate() {
    return "${this.theDate.year.toString()}-${this.theDate.month.toString().padLeft(2, '0')}-${this.theDate.day.toString().padLeft(2, '0')} ${this.theDate.hour.toString().padLeft(2, '0')}:${this.theDate.minute.toString().padLeft(2, '0')}:${this.theDate.second.toString().padLeft(2, '0')}";
  }

// // 農曆
//   String lunarDateString() {
//     Solar solar = Solar(
//         solarYear: this.theDate.year,
//         solarMonth: this.theDate.month,
//         solarDay: this.theDate.day);
//     Lunar lunar = LunarSolarConverter.solarToLunar(solar);
//     return "${lunar.lunarYear.toString()}-${lunar.lunarMonth.toString().padLeft(2, '0')}-${lunar.lunarDay.toString().padLeft(2, '0')} ${this.theDate.hour.toString().padLeft(2, '0')}:${this.theDate.minute.toString().padLeft(2, '0')}:${this.theDate.second.toString().padLeft(2, '0')}";
//   }

//   static String lunarForSolarYear(DateTime date) {
//     Solar solar =
//         Solar(solarYear: date.year, solarMonth: date.month, solarDay: date.day);
//     Lunar lunar = LunarSolarConverter.solarToLunar(solar);
//     String dayStr = _lunarDays[lunar.lunarDay - 1];
//     String monthStr = _lunarMonths[lunar.lunarMonth - 1];
//     return "$monthStr-$dayStr";
//     //return "${lunar.lunarMonth.toString().padLeft(2, '0')}-${lunar.lunarDay.toString().padLeft(2, '0')}";
//   }

//通过公历获取属性---------------------------------------------------------------

  //方法注释：年干
  PWBSkyTrunkModel skyTrunkYear() {
    int index = (this.theDate.year - 4) % 10;
    if (1 == this.theDate.month) {
      if (0 == index) {
        index = 9;
      } else {
        index -= 1;
      }
    } else if (2 == this.theDate.month) {
      if (this.theDate.isBefore(this.solarTerms[0].termDate)) {
        if (index == 0) {
          index = 9;
        } else {
          index -= 1;
        }
      }
    }
    return PWBSkyTrunkModel(PWBSkyTrunkEnum.values[index]);
  }

  //方法注释：年支
  PWBEarthBranchModel earthBranchYear() {
    int index = (this.theDate.year - 4) % 12;
    if (this.theDate.month == 1) {
      if (index == 0) {
        index = 11;
      } else {
        index -= 1;
      }
    } else if (this.theDate.month == 2) {
      if (this.theDate.isBefore(this.solarTerms[0].termDate)) {
        if (index == 0) {
          index = 11;
        } else {
          index -= 1;
        }
      }
    }
    return PWBEarthBranchModel(PWBEarchBranchEnum.values[index]);
  }

  //方法注释：生肖
  String shengXiao() {
    return earthBranchYear().shengxiaoValue();
  }

  //方法注释：以年干和月支求月干
  PWBSkyTrunkModel skyTrunkMonth() {
    int yearIndex = skyTrunkYear().value.index % 5; //find(天干表, 年干)! % 5
    int monthIndex = earthBranchMonth().value.index; //find(地支表, 月支)!
    if (monthIndex == 0 || monthIndex == 1) {
      monthIndex += 12;
    }
    int index = (yearIndex * 2 + monthIndex) % 10;
    return PWBSkyTrunkModel(PWBSkyTrunkEnum.values[index]);
  }

  //方法注释：月地支，以節氣轉換為準
  PWBEarthBranchModel earthBranchMonth() {
    int index = this.theDate.month % 12;

    if (this.theDate.isBefore(this.solarTerms[0].termDate)) {
      if (index == 0) {
        index = 11;
      } else {
        index -= 1;
      }
    }
    return PWBEarthBranchModel(PWBEarchBranchEnum.values[index]);
  }

  //方法注释：日干函数
  PWBSkyTrunkModel skyTrunkDay() {
    String start = "1921-01-01 00:00:00"; // 甲子日起算
    DateTime dateStart = DateTime.parse(start).toLocal();
    Duration duration = dateStart.difference(this.theDate);
    int index = duration.inDays % 10;
    index = index >= 0 ? index : index + 10;
    return PWBSkyTrunkModel(PWBSkyTrunkEnum.values[index]);
  }

  //方法注释：日支函数
  PWBEarthBranchModel earthBranchDay() {
    String start = "1921-01-01 00:00:00"; // 甲子日起算
    DateTime dateStart = DateTime.parse(start).toLocal();
    Duration duration = dateStart.difference(this.theDate);
    int index = duration.inDays % 12;
    index = index >= 0 ? index : index + 12;
    return PWBEarthBranchModel(PWBEarchBranchEnum.values[index]);
  }

  //方法注释：日干,採子正(0時)換日法，從日干轉換
  PWBSkyTrunkModel skyTrunkHour() {
    int dayIndex = skyTrunkDay().value.index % 5; //find(天干表, 日干)! % 5
    int hourIndex = earthBranchHour().value.index;
    int index = ((dayIndex * 2) + hourIndex) % 10;
    return PWBSkyTrunkModel(PWBSkyTrunkEnum.values[index]);
  }

  //方法注释：日支:  以節氣轉換為準
  PWBEarthBranchModel earthBranchHour() {
    int hour = this.theDate.hour;
    int index = ((hour == 23 ? 0 : hour) + 1) ~/ 2;
    return PWBEarthBranchModel(PWBEarchBranchEnum.values[index]);
  }

  // 方法注释：十神函数
  PWBTenGodModel getTenGod(PWBSkyTrunkModel aBranch) {
    int x = skyTrunkDay().elementValue().value.index;
    int y = aBranch.elementValue().value.index;
    int b = skyTrunkDay().biValue() * aBranch.biValue();
    int index = (4 * x + y) % 5 + 1;
    index *= b;
    return PWBTenGodModel(index);
  }

  // 方法注释：获取十神名字的竖排版显示方式
  String getTenGodForVerticalName(PWBSkyTrunkModel aBranch) {
    return getTenGod(aBranch).verticalName();
  }

  // 方法注释：返回該年月的天數
  int monthDaysInYear(int y, int m) {
    return (((lunarInfo()[y - 1900] & (0x10000 >> m)) != 0) ? 30 : 29);
  }

  // 方法注释：該年閏月
  int doubleMonthInYear(int y) {
    return (lunarInfo()[y - 1900] & 0xf);
  }

  // 方法注释：該年閏月天數
  int doubleMonthDaysInYear(int y) {
    if (doubleMonthInYear(y) != 0) {
      return (((lunarInfo()[y - 1900] & 0x10000) != 0) ? 30 : 29);
    } else {
      return 0;
    }
  }

//基础函数--------------------------------------------------------------------

  int ifGregorian(int y, int m, int d, int option) {
    if (option == 1) {
      if (y > 1582 ||
          (y == 1582 && m > 10) ||
          (y == 1582 && m == 10 && d > 14)) {
        return (1); //Gregorian
      } else {
        if (y == 1582 && m == 10 && d >= 5 && d <= 14) {
          return (-1); //空
        } else {
          return (0); //Julian
        }
      }
    }

    if (option == 2) {
      return (1); //Gregorian
    }

    if (option == 3) {
      return (0); //Julian
    }
    return (-1);
  }

  int dayDifference(int y, int m, int d) {
    List<int> monL = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    int ifG = ifGregorian(y, m, d, 1);
    if (1 == ifG) {
      if ((y % 100 != 0 && y % 4 == 0) || (y % 400 == 0))
        monL[2] += 1;
      else if (y % 4 == 0) {
        monL[2] += 1;
      }
      ;
    }
    //else cont.

    int v = 0;
    for (int i = 0; i <= (m - 1); i++) {
      v += monL[i];
    }
    v += d;

    // 換曆年 天數修正
    if (y == 1582) {
      if (ifG == 1) {
        v -= 10;
      }
      if (ifG == -1) {
        v = 0;
      } // 1582/10/5 ~ 10/14 日期無效
    }

    return v;
  }

  int equivalentStandardDay(int y, int m, int d) {
    //Julian的等效标准天数
    int v = (y - 1) * 365 + ((y - 1) ~/ 4);
    v += dayDifference(y, m, d) - 2;

    //Gregorian的等效标准天数
    if (y > 1582) {
      v += -((y - 1) ~/ 100) + ((y - 1) ~/ 400);
      v += 2;
    }
    return v;
  }

  double term(int y, int n, bool pd) {
    // 儒略日
    double juD = 365.2423112;

    juD -= 6.4e-14 * (y - 100) * (y - 100);
    juD -= 3.047e-8 * (y - 100);
    juD *= y;
    juD += 15.218427 * n + 1721050.71301;

    // 角度
    double tht = 3e-4 * y - 0.372781384 - 0.2617913325 * n;

    //年差实均数
    double yrD = (1.945 * sin(tht) - 0.01206 * sin(2 * tht));
    yrD *= (1.048994 - 2.583e-5 * y);

    //朔差实均数
    double shuoD = -18e-4 * sin(2.313908653 * y - 0.439822951 - 3.0443 * n);

    double vs = pd
        ? (juD + yrD + shuoD - equivalentStandardDay(y, 1, 0) - 1721425)
        : (juD - equivalentStandardDay(y, 1, 0) - 1721425);
    return vs;
  }

  int antiDayDifference(int y, int d) {
    int x = d;
    int m = 1;

    for (int j = 1; j <= 12; j++) {
      int mL = dayDifference(y, (j + 1), 1) - dayDifference(y, j, 1);
      if ((x <= mL) || j == 12) {
        m = j;
        break;
      } else {
        x = x - mL;
      }
    }
    return 100 * m + x;
  }

  double tail(double x) {
    return x - x.floor();
  }

  // 計算當月節氣日期
  List<PWBSolarTermModel> computeSolarTerm(int month) {
    List<PWBSolarTermModel> result = [];
    for (int n = (month * 2 - 1); n <= month * 2; n++) {
      double termDays = term(this.theDate.year, n, true);
      int mdays = antiDayDifference(this.theDate.year, termDays.toInt());
      int termDay = mdays % 100;
      int hour = (tail(termDays) * 24).toInt();
      int minute = ((tail(termDays) * 24 - hour) * 60).toInt();

      DateTime termDate = DateTime(
          this.theDate.year, this.theDate.month, termDay, hour, minute);

      if (n < 3) {
        result.add(PWBSolarTermModel(
            PWBSolarTermModel.solarterms()[n + 21], termDate));
      } else {
        PWBSolarTermModel model =
            PWBSolarTermModel(PWBSolarTermModel.solarterms()[n - 3], termDate);
        result.add(model);
      }
    }
    return result;
  }

//常量--------------------------------------------------------------------------

  // 方法注释：从网上抄的，估计是天数
  List<int> lunarInfo() {
    return [
      0x04bd8, 0x04ae0, 0x0a570, 0x054d5, 0x0d260, 0x0d950, 0x16554, 0x056a0,
      0x09ad0, 0x055d2, //1900 ~ 1909
      0x04ae0, 0x0a5b6, 0x0a4d0, 0x0d250, 0x1d255, 0x0b540, 0x0d6a0, 0x0ada2,
      0x095b0, 0x14977, //1910
      0x04970, 0x0a4b0, 0x0b4b5, 0x06a50, 0x06d40, 0x1ab54, 0x02b60, 0x09570,
      0x052f2, 0x04970, //1920
      0x06566, 0x0d4a0, 0x0ea50, 0x06e95, 0x05ad0, 0x02b60, 0x186e3, 0x092e0,
      0x1c8d7, 0x0c950, //1930
      0x0d4a0, 0x1d8a6, 0x0b550, 0x056a0, 0x1a5b4, 0x025d0, 0x092d0, 0x0d2b2,
      0x0a950, 0x0b557, //1940

      0x06ca0, 0x0b550, 0x15355, 0x04da0, 0x0a5b0, 0x14573, 0x052b0, 0x0a9a8,
      0x0e950, 0x06aa0, //1950
      0x0aea6, 0x0ab50, 0x04b60, 0x0aae4, 0x0a570, 0x05260, 0x0f263, 0x0d950,
      0x05b57, 0x056a0, //1960
      0x096d0, 0x04dd5, 0x04ad0, 0x0a4d0, 0x0d4d4, 0x0d250, 0x0d558, 0x0b540,
      0x0b6a0, 0x195a6, //1970
      0x095b0, 0x049b0, 0x0a974, 0x0a4b0, 0x0b27a, 0x06a50, 0x06d40, 0x0af46,
      0x0ab60, 0x09570, //1980
      0x04af5, 0x04970, 0x064b0, 0x074a3, 0x0ea50, 0x06b58, 0x055c0, 0x0ab60,
      0x096d5, 0x092e0, //1990

      0x0c960, 0x0d954, 0x0d4a0, 0x0da50, 0x07552, 0x056a0, 0x0abb7, 0x025d0,
      0x092d0, 0x0cab5, //2000
      0x0a950, 0x0b4a0, 0x0baa4, 0x0ad50, 0x055d9, 0x04ba0, 0x0a5b0, 0x15176,
      0x052b0, 0x0a930, //2010
      0x07954, 0x06aa0, 0x0ad50, 0x05b52, 0x04b60, 0x0a6e6, 0x0a4e0, 0x0d260,
      0x0ea65, 0x0d530, //2020
      0x05aa0, 0x076a3, 0x096d0, 0x04bd7, 0x04ad0, 0x0a4d0, 0x1d0b6, 0x0d250,
      0x0d520, 0x0dd45, //2030
      0x0b5a0, 0x056d0, 0x055b2, 0x049b0, 0x0a577, 0x0a4b0, 0x0aa50, 0x1b255,
      0x06d20, 0x0ada0, //2040

      0x04b63, 0x0937f, 0x049f8, 0x04970, 0x064b0, 0x068a6, 0x0ea5f, 0x06b20,
      0x0a6c4, 0x0aaef, //2050
      0x092e0, 0x0d2e3, 0x0c960, 0x0d557, 0x0d4a0, 0x0da50, 0x05d55, 0x056a0,
      0x0a6d0, 0x055d4, //2060
      0x052d0, 0x0a9b8, 0x0a950, 0x0b4a0, 0x0b6a6, 0x0ad50, 0x055a0, 0x0aba4,
      0x0a5b0, 0x052b0, //2070
      0x0b273, 0x06930, 0x07337, 0x06aa0, 0x0ad50, 0x04b55, 0x04b6f, 0x0a570,
      0x054e4, 0x0d260, //2080
      0x0e968, 0x0d520, 0x0daa0, 0x06aa6, 0x056df, 0x04ae0, 0x0a9d4, 0x0a4d0,
      0x0d150, 0x0f252, //2090
      0x0d520
    ];
  }
}

//农历日期名
List _lunarDays = [
  "初一",
  "初二",
  "初三",
  "初四",
  "初五",
  "初六",
  "初七",
  "初八",
  "初九",
  "初十",
  "十一",
  "十二",
  "十三",
  "十四",
  "十五",
  "十六",
  "十七",
  "十八",
  "十九",
  "二十",
  "廿一",
  "廿二",
  "廿三",
  "廿四",
  "廿五",
  "廿六",
  "廿七",
  "廿八",
  "廿九",
  "三十"
];

//农历月份名
List _lunarMonths = [
  "正",
  "二",
  "三",
  "四",
  "五",
  "六",
  "七",
  "八",
  "九",
  "十",
  "十一",
  "腊"
];
