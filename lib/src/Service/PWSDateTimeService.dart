import 'package:intl/intl.dart';

class PWSDateTimeService {
  //可以改为将yyyy替换为theDate.year.toString()，将mm替换为theDate.month.toString().padLeft(2, '0')，以此类推
  static String stringFromDate(DateTime theDate, String formatStr) {
    if ('yyyy-MM-dd HH:mm:ss' == formatStr) {
      return "${theDate.year.toString()}-${theDate.month.toString().padLeft(2, '0')}-${theDate.day.toString().padLeft(2, '0')} ${theDate.hour.toString().padLeft(2, '0')}:${theDate.minute.toString().padLeft(2, '0')}:${theDate.second.toString().padLeft(2, '0')}";
    } else if ('yyyy-MM-dd' == formatStr) {
      return "${theDate.year.toString()}-${theDate.month.toString().padLeft(2, '0')}-${theDate.day.toString().padLeft(2, '0')}";
    } else if ('yyyy年MM月dd' == formatStr) {
      return "${theDate.year.toString()}年${theDate.month.toString().padLeft(2, '0')}月${theDate.day.toString().padLeft(2, '0')}";
    } else if ('yyyy年MM月' == formatStr) {
      return "${theDate.year.toString()}年${theDate.month.toString().padLeft(2, '0')}月";
    } else if ('yyyy年  MM月  dd日' == formatStr) {
      return "${theDate.year.toString()}年  ${theDate.month.toString().padLeft(2, '0')}月  ${theDate.day.toString().padLeft(2, '0')}日";
    } else
      return '';
  }

  // static DateTime dateFromString(String dateStr) {
  //   // dateStr=[dateStr stringByAppendingString:@"01"];
  //   // NSDateFormatter *format = [[NSDateFormatter alloc] init];
  //   // [format setDateFormat:@"yyyy年MM月dd"];
  //   // NSDate* date=[format dateFromString:dateStr];
  //   // return date;
  //   return DateFormat('yyyy-MM-dd').parse(dateStr);
  // }

  static DateTime dateFromString(String dateString) {
    return DateFormat('yyyy-MM-dd').parse(dateString);
  }

  static DateTime dateFromMonthString(String dateString) {
    return DateFormat('yyyy年MM月').parse(dateString);
  }
}
