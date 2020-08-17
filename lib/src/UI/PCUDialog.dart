import 'package:flutter/material.dart';
import 'Base/PCUDateButton.dart';

class PCUDialog extends StatefulWidget {
  PCUDialog({this.selectedDate, this.onDateSelectBlk, this.currentDate});

  //用户选择的日期.
  final DateTime selectedDate;

  //用户选择日期后的操作.
  final void Function(DateTime) onDateSelectBlk;

  //当前日历的显示月份,默认显示为当前月份的日历.
  final DateTime currentDate;

  @override
  _PCUDialogState createState() {
    return _PCUDialogState();
  }
}

class _PCUDialogState extends State<PCUDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            PCUDateButton('上一月', _monthSelectAction),
            Text("2020年8月"),
            PCUDateButton('下一月', _monthSelectAction),
          ],
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: GridView.count(
              //水平子Widget之间间距
              crossAxisSpacing: 5.0,
              //垂直子Widget之间间距
              mainAxisSpacing: 5.0,
              //GridView内边距
              padding: EdgeInsets.all(10.0),
              //一行的Widget数量
              crossAxisCount: 7,
              //子Widget宽高比例
              childAspectRatio: 2.0,
              //子Widget列表
              children: getWidgetList(context),
            ),
          ),
        ),
      ],
    );
  }

  void _monthSelectAction() {}

  List<Widget> getWidgetList(context) {
    return getDataList()
        .map((item) => getItemContainer(item, context))
        .toList();
  }

  List<String> getDataList() {
    List<String> list = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"];
    for (int i = 0; i < 100; i++) {
      list.add(i.toString());
    }
    return list;
  }

  Widget getItemContainer(String item, context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () => setOnDateSelectBlk(item, context),
        child: Text(
          item,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        color: Colors.blue,
      ),
    );
  }

  void setOnDateSelectBlk(item, context) {
    print(item);
    Navigator.of(context).pop();
  }
}
