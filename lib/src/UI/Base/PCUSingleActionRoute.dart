import 'package:flutter/material.dart';

import '../../Context/PCCGloable.dart';
import 'PCUDateButton.dart';
import 'PCUDateTile.dart';

class PCUSingleActionRoute extends StatefulWidget {
  PCUSingleActionRoute(
      {Key? key,
      this.title, //顶部的文案
      this.rightTopTitle, //右上角按钮的文案
      this.rightTopAction, //右上角按钮的相应操作
      this.floatingAction, //右上角按钮的相应操作
      this.body})
      : super(key: key);
  final String? title;
  final String? rightTopTitle;
  final VoidCallback? rightTopAction;
  final VoidCallback? floatingAction;
  final Widget? body;
  @override
  _PCUSingleActionRouteState createState() => _PCUSingleActionRouteState();
}

class _PCUSingleActionRouteState extends State<PCUSingleActionRoute> {
  @override
  Widget build(BuildContext context) {
    double _screenScale =
        MediaQuery.of(context).size.width / const_iPhone11_width;

    return Theme(
      data: ThemeData(primaryColor: Colors.white),
      child: Scaffold(
        appBar: AppBar(
          title: PCUDateTile(widget.title!),
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 50,
            ),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Color(int.parse(const_color_action)),
                iconSize: 20 * _screenScale,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          actions: [
            PCUDateButton(widget.rightTopTitle!, widget.rightTopAction!),
          ],
        ),
        body: widget.body,
        floatingActionButton: FloatingActionButton(
          onPressed: widget.floatingAction,
          backgroundColor: Colors.white,
          tooltip: 'Increment',
          child: Icon(
            Icons.add,
            color: Color(int.parse(const_color_action)),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
