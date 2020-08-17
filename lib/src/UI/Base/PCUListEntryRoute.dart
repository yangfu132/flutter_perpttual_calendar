import 'package:flutter/material.dart';
import 'PCUSingleActionRoute.dart';
import '../../Context/PCCGloable.dart';

class PCUListEntryRoute extends StatefulWidget {
  PCUListEntryRoute(this.dataList, {this.title, Key key}) : super(key: key);
  final String title;
  final List<String> dataList;
  @override
  PCUListEntryRouteState createState() {
    return PCUListEntryRouteState();
  }
}

class PCUListEntryRouteState extends State<PCUListEntryRoute> {
  @override
  Widget build(BuildContext context) {
    return PCUSingleActionRoute(
      title: null != widget.title ? widget.title : "请选择",
      strActionTitle: '',
      actionCall: null,
      floatingCall: null,
      body: ListView.separated(
          itemCount: widget.dataList.length,
          // itemExtent: 50,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                widget.dataList[index],
                style: TextStyle(color: Color(int.parse(const_color_label))),
              ),
              onTap: () {
                Navigator.pop(context, widget.dataList[index]);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Color(int.parse(const_color_separate)),
            );
          }),
    );
  }
}
