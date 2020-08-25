import 'package:flutter/material.dart';
import '../Context/PCCGloable.dart';
import '../Business/PerpttualCalendar/PWBEarthBranchModel.dart';
import '../Business/PerpttualCalendar/PWBSkyTrunkModel.dart';
import 'Base/PCUDateButton.dart';
import 'Base/PCUDateTile.dart';
import 'Base/PCUSingleActionRoute.dart';
import 'Base/PCUListEntryRoute.dart';
import 'Base/PCUInfoWidget.dart';
import 'PCUDialog.dart';
import './Calendar/Calendar.dart';
import 'Calendar/PCUCalendarWidget.dart';

class PCUSelectDateRoute extends StatefulWidget {
  PCUSelectDateRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PCUSelectDateRouteState createState() => _PCUSelectDateRouteState();
}

class _PCUSelectDateRouteState extends State<PCUSelectDateRoute> {
  String _strDateBtn = '请选择日期';
  String _strMonthSkyBtn = '请选择月之天干';
  String _strMonthEarthBtn = '请选择月之地支';
  String _strDaySkyBtn = '请选择日之天干';
  String _strDayEarthBtn = '请选择日之地支';

  @override
  Widget build(BuildContext context) {
    return PCUSingleActionRoute(
      title: widget.title,
      strActionTitle: '重置',
      actionCall: _onResetClicked,
      floatingCall: _incrementCounter,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15.0, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    PCUDateTile('时间：'),
                    PCUDateButton(_strDateBtn, () => _onCalendarClick(context)),
                  ],
                ),
                Row(
                  children: [
                    PCUDateTile('月    ：'),
                    PCUDateButton(_strMonthSkyBtn, _onMonthSkyClicked),
                    PCUDateButton(_strMonthEarthBtn, _onMonthEarthClicked),
                  ],
                ),
                Row(
                  children: [
                    PCUDateTile('日    ：'),
                    PCUDateButton(_strDaySkyBtn, _onDaySkyClicked),
                    PCUDateButton(_strDayEarthBtn, _onDayEarthClicked),
                  ],
                ),
                PCUDateButton(_strMonthSkyBtn, () {
                  showCustomDialog<bool>(
                    context: context,
                    builder: (context) {
                      return Dialog(
                          child: Calendar(
                        firstTime: DateTime.now(),
                        initTime: DateTime.now(),
                        endTime: DateTime.now(),
                      ));
                    },
                  );
                }),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 21),
            child: PCUInfoWidget('如果没有设置，会默认为当前日期。'),
          ),
        ],
      ),
    );
  }

  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87, // 自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  void _onResetClicked() {
    setState(() {
      _strDateBtn = '请选择日期';
      _strMonthSkyBtn = '请选择月之天干';
      _strMonthEarthBtn = '请选择月之地支';
      _strDaySkyBtn = '请选择日之天干';
      _strDayEarthBtn = '请选择日之地支';
    });
  }

  void _onCalendarClick(context) {
    showCustomDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(child: PCUCalendarWidget());
        // return Dialog(
        //     child: Calendar(
        //   firstTime: DateTime.now(),
        //   initTime: DateTime.now(),
        //   endTime: DateTime.now(),
        // ));
      },
    );
  }

  void _onMonthSkyClicked() async {
    _strMonthSkyBtn =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PCUListEntryRoute(PWBSkyTrunkModel.skyTrunk());
    }));
    setState(() {});
  }

  void _onMonthEarthClicked() async {
    _strMonthEarthBtn =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PCUListEntryRoute(PWBEarthBranchModel.earthBranch());
    }));
    setState(() {});
  }

  void _onDaySkyClicked() async {
    _strDaySkyBtn =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PCUListEntryRoute(PWBSkyTrunkModel.skyTrunk());
    }));
    setState(() {});
  }

  void _onDayEarthClicked() async {
    _strDayEarthBtn =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PCUListEntryRoute(PWBEarthBranchModel.earthBranch());
    }));
    setState(() {});
  }

  void _incrementCounter() {
    setState(() {});
  }
}
