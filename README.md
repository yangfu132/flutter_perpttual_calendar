# flutter_perpttual_calendar

基于flutter&Dart的万年历

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

///展示日历的example,可以通过点击"选择日期"进入选择日期界面
example

///选择日期界面
PCUSingleActionRoute

///基于历法而衍生出的日历业务逻辑
WHUCalendarCal

    ///获取当前的时间，默认格式为'yyyy-MM-dd'
    String? currentDateStr()

    ///根据传入日期，初始化日历的上月、当月、下月数据
    Map? loadDataWith(String dateStr)

    ///根据传入data生成日历数据
    Map calendarMapWith(DateTime date)

    ///根据转入的日期，切换上月、当月、下月数据；
    void turnCalendarMapWithCallBack(String dateStr,void Function(Map? dic) completeBlk)

    ///生成上个月数据
    Map getPreCalendarMap(String dateStr)


    ///生成下个月数据
    Map getNextCalendarMap(String dateStr)

    ///切换到上个月
    void preMonthCalendar(String dateStr, void Function(Map?) completionBlk)

    ///切换到下个月
    void nextMonthCalendar(String dateStr, void Function(Map?) completionBlk)

    ///上个月的名字
    String titleOfPreMonth(String dateStr)

    ///下个月的名字
    String titleOfNextMonth(String dateStr)

    ///假期
    String? getCommonHoliday(DateTime calendarDay)

    ///获得当前月的第一天
    DateTime getFirstDayOfMonth(DateTime date)

    ///获得当前月的最后一天
    DateTime getLastDayOfMonth(DateTime date)

    ///获得上个月的DateTime
    DateTime getPreMonth(DateTime date)

    ///获得下个月的DateTime
    DateTime getLastMonth(DateTime date)

    /// 获取这个月的天数
    static int getDaysInMonth(int year, int month)

///类注释：历法业务逻辑
PWBCalendarBusiness
    ///方法注释： 返回传入日期的公曆描述
    String stringFromDate()

    ///方法注释：年干
    PWBSkyTrunkModel skyTrunkYear()

    ///方法注释：年支
    PWBEarthBranchModel earthBranchYear()

    ///方法注释：生肖
    String? shengXiao()

    ///方法注释：以年干和月支求月干
    PWBSkyTrunkModel skyTrunkMonth()

    ///方法注释：月地支，以節氣轉換為準
    PWBEarthBranchModel earthBranchMonth()

    ///方法注释：日干函数
    PWBSkyTrunkModel skyTrunkDay()

    ///方法注释：日支函数
    PWBEarthBranchModel earthBranchDay()

    ///方法注释：时干,採子正(0時)換日法，從日干轉換
    PWBSkyTrunkModel skyTrunkHour()

    ///方法注释：时支:  以節氣轉換為準
    PWBEarthBranchModel earthBranchHour()

    /// 方法注释：十神函数
    PWBTenGodModel getTenGod(PWBSkyTrunkModel aBranch)

    /// 方法注释：获取十神名字的竖排版显示方式
    String? getTenGodForVerticalName(PWBSkyTrunkModel aBranch)

    /// 方法注释：返回該年月的天數
    int monthDaysInYear(int y, int m)

    /// 方法注释：該年閏月
    int doubleMonthInYear(int y)

    /// 方法注释：該年閏月天數
    int doubleMonthDaysInYear(int y)