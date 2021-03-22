import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_grid.dart';
import 'package:flutter/src/rendering/sliver.dart';
import 'TimeUtil.dart';
import '../../Context/PCCContext.dart';

class DayGridView extends StatefulWidget {
  DateTime initDate;
  DateTime selectDate;

  int year;
  int month;

  ValueChanged? onChange;

  DayGridView({
    Key? key,
    /*required*/ required this.initDate,
    /*required*/ required this.selectDate,
    /*required*/ required this.year,
    /*required*/ required this.month,
    this.onChange,
  });

  @override
  State<DayGridView> createState() => _DayGridViewState();
}

class _DayGridViewState extends State<DayGridView> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> dayItems() {
    List days = TimeUtil.getDay(
        widget.year, widget.month, MaterialLocalizations.of(context));
    List dayWidgets = days.map((value) {
      if (value is int) {
        return Container();
      }
      if (value == widget.selectDate) {
        return GestureDetector(
          onTap: () {
            widget.onChange!(widget.selectDate);
          },
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Container(
              width: PCCContext.px2pt(60),
              height: PCCContext.px2pt(60),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: Text(
                value.day.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      } else {
        if (value == widget.initDate) {
          return GestureDetector(
            onTap: () {
              widget.onChange!(widget.initDate);
            },
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Text(
                value.day.toString(),
                style: TextStyle(color: Colors.blue),
              ),
            ),
          );
        } else {
          if (value.isAfter(widget.initDate)) {
            /// 在今天之后的时间无法点击
            return GestureDetector(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  value.day.toString(),
                  style: TextStyle(color: Colors.black38),
                ),
              ),
            );
          } else {
            /// 在今天之前的时间可以点击
            return GestureDetector(
              onTap: () {
                widget.onChange!(value);
              },
              child: Container(
                color: Colors.white,
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    value.day.toString(),
                    style: TextStyle(color: Colors.black12),
                  ),
                ),
              ),
            );
          }
        }
      }
    }).toList();
    return dayWidgets as List<Widget>;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = dayItems();
    return Container(
      height: PCCContext.px2pt(600),
      child: GridView.custom(
          gridDelegate:
              _DayPickerGridDelegate(mainAxisNumber: list.length > 35 ? 6 : 5),
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          childrenDelegate:
              SliverChildListDelegate(list, addRepaintBoundaries: false)),
    );
  }
}

/// 自定义GridView
class _DayPickerGridDelegate extends SliverGridDelegate {
  final int? mainAxisNumber;
  const _DayPickerGridDelegate({
    this.mainAxisNumber,
  });
  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    const int columnCount = DateTime.daysPerWeek;
    final double tileWidth = constraints.crossAxisExtent / columnCount;
    final double tileHeight = PCCContext.px2pt(600) / mainAxisNumber!;
    return SliverGridRegularTileLayout(
      crossAxisCount: columnCount,
      mainAxisStride: tileHeight,
      crossAxisStride: tileWidth,
      childMainAxisExtent: tileHeight,
      childCrossAxisExtent: tileWidth,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(SliverGridDelegate oldDelegate) {
    return false;
  }
}

const _DayPickerGridDelegate _kDayPickerGridDelegate = _DayPickerGridDelegate();
