import 'package:flutter/material.dart';
import 'package:flutter_perpttual_calendar/src/Business/Calendar/WHUCalendarItem.dart';

// import '../../Business/Calendar/WHUCalendarItem.dart';
import '../../Context/PCCContext.dart';
import '../Base/PCUTriangleWidget.dart';

class PCUCalendarCell extends StatefulWidget {
  PCUCalendarCell(this.widgetHeight);
  late final String? lbl;
  late final String? dbl;
  late final bool isToday;
  late final bool isDayInCurMonth;
  late final bool isHighlighted = false;
  late final WHUCalendarItem? dateItem;
  late final double widgetHeight;

  late final ValueChanged<WHUCalendarItem?>? onChange;

  @override
  State<PCUCalendarCell> createState() {
    return _PCUCalendarCellState();
  }
}

class _PCUCalendarCellState extends State<PCUCalendarCell> {
  Color colorHighlight = Color.fromARGB(
    (0.3 * 255).toInt(),
    (0.02 * 255).toInt(),
    (0.45 * 255).toInt(),
    (0.67 * 255).toInt(),
  );

  Color getTextColor() {
    Color colorText = Colors.grey;
    if (widget.isHighlighted) {
      colorText = Colors.white;
    } else if (widget.isDayInCurMonth) {
      //colorText = Color(int.parse(const_color_label));
      colorText = Colors.black;
    }
    return colorText;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChange!(widget.dateItem);
        Navigator.of(context).pop();
      },
      child: Container(
        color: widget.isHighlighted ? colorHighlight : Colors.white,
        child: Padding(
          padding: EdgeInsets.all(1),
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 10,
                  width: widget.isToday
                      ? widget.widgetHeight / 2
                      : widget.widgetHeight - 1,
                  height: widget.widgetHeight / 2,
                  child: Text(
                    '${widget.lbl}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: getTextColor(),
                      fontSize: PCCContext.scale(13, context),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 40,
                  width: widget.widgetHeight - 1,
                  height: widget.widgetHeight / 2,
                  child: Text(
                    '${widget.dbl}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: getTextColor(),
                      fontSize: PCCContext.scale(8, context),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: PCUTriangleWidget(
                    width: widget.isToday ? widget.widgetHeight / 2 : 0,
                    height: widget.isToday ? widget.widgetHeight / 2 : 0,
                    child: Column(children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: widget.widgetHeight / 5 - 3,
                          child: Text(
                            '今',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: getTextColor(),
                                fontSize: PCCContext.scale(6, context),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 1),
                          child: Text(
                            '天',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: getTextColor(),
                                fontSize: PCCContext.scale(6, context),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
