import 'package:flutter/cupertino.dart';
// import 'package:flutter_xiaoe/utils/ScreenUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../Context/PCCContext.dart';
import 'DayGridViewDemo.dart';
import 'TimeUtil.dart';
// import 'package:flutter_xiaoe/config/Colors.dart';

class Calendar extends StatefulWidget {
  final DateTime? initTime;
  final DateTime? firstTime;
  final DateTime? endTime;
  final ValueChanged? onChange;

  Calendar({
    Key? key,
    this.initTime,
    this.firstTime,
    this.endTime,
    this.onChange,
  }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  PageController? pageController;
  DateTime? selectDate;
  int initPage = 0;
  int totalPage = 0;

  @override
  void initState() {
    super.initState();
    print(widget.firstTime!.month);
    selectDate = widget.initTime;

    /// 总共的月份数目
    totalPage = 3;
    // (widget.endTime.year - widget.firstTime.year == 0
    //     ? widget.endTime.month
    //     : ((widget.endTime.year - widget.firstTime.year) * 12 +
    //         widget.endTime.month -
    //         widget.firstTime.month +
    //         1));

    /// 当前月份处于
    initPage = -1;
    // (widget.initTime.year - widget.firstTime.year == 0
    //     ? widget.initTime.month
    //     : ((widget.initTime.year - widget.firstTime.year) * 12 +
    //         widget.initTime.month -
    //         widget.firstTime.month +
    //         1));
    print(totalPage);
    print(initPage);
    pageController = PageController(
      initialPage: totalPage,
    );
  }

  onChange(time) {
    if (selectDate != time) {
      setState(() {
        selectDate = time;
        if (null != widget.onChange) widget.onChange!(time);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: TimeUtil.getDayHeaders(MaterialLocalizations.of(context)),
      ),
      Container(
        color: Colors.white,
        height: PCCContext.px2pt(600),
        child: PageView.builder(
          itemBuilder: (BuildContext context, int index) {
            return DayGridView(
              initDate: DateTime(
                widget.initTime!.year,
                widget.initTime!.month,
                widget.initTime!.day,
              ),
              selectDate: DateTime(
                  selectDate!.year, selectDate!.month, selectDate!.day),
              year: widget.firstTime!.year +
                  ((widget.firstTime!.month + index - 1) / 12).floor(),
              month: (widget.firstTime!.month + index) % 12 == 0
                  ? 12
                  : (widget.firstTime!.month + index) % 12,
              onChange: onChange,
            );
          },
          itemCount: totalPage,
          controller: pageController,
        ),
      ),
    ]);
  }
}
