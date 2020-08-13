import 'package:flutter/material.dart';
import '../Context/PCCGloable.dart';
import '../Business/PWBEarthBranchModel.dart';
import '../Business/PWBSkyTrunkModel.dart';
import 'PCUDateButton.dart';
import 'PCUDateTile.dart';
import 'PCUSingleActionRoute.dart';
import 'PCUListEntryRoute.dart';

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
    double _screenScale =
        MediaQuery.of(context).size.width / const_iPhone11_width;
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
                    PCUDateButton(_strDateBtn, () {}),
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
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 21),
            child: Text(
              '如果没有设置，会默认为当前日期。',
              style: TextStyle(
                  color: Color(int.parse(const_color_label)),
                  fontSize: 13 * _screenScale),
            ),
          )
        ],
      ),
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
