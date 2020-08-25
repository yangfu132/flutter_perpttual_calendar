import 'package:intl/intl.dart';

class PWSDateTimeService {
  static String gregorianDateString(DateTime theDate, String formatStr) {
    if ('yyyy-MM-dd HH:mm:ss' == formatStr) {
      return "${theDate.year.toString()}-${theDate.month.toString().padLeft(2, '0')}-${theDate.day.toString().padLeft(2, '0')} ${theDate.hour.toString().padLeft(2, '0')}:${theDate.minute.toString().padLeft(2, '0')}:${theDate.second.toString().padLeft(2, '0')}";
    } else if ('yyyy-MM-dd' == formatStr) {
      return "${theDate.year.toString()}-${theDate.month.toString().padLeft(2, '0')}-${theDate.day.toString().padLeft(2, '0')}";
    } else if ('yyyy年MM月dd' == formatStr) {
      return "${theDate.year.toString()}年${theDate.month.toString().padLeft(2, '0')}月${theDate.day.toString().padLeft(2, '0')}";
    } else if ('yyyy年MM月' == formatStr) {
      return "${theDate.year.toString()}年${theDate.month.toString().padLeft(2, '0')}月";
    } else
      return '';
  }

  static DateTime dateFromMonthString(String dateStr) {
    // dateStr=[dateStr stringByAppendingString:@"01"];
    // NSDateFormatter *format = [[NSDateFormatter alloc] init];
    // [format setDateFormat:@"yyyy年MM月dd"];
    // NSDate* date=[format dateFromString:dateStr];
    // return date;
    return DateFormat('yyyy-MM-dd').parse(dateStr);
  }

  static DateTime dateFromString(String dateString) {
    return DateFormat('yyyy-MM-dd').parse(dateString);
  }
}
