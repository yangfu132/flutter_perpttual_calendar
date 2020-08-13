import 'package:flutter/material.dart';
import '../Context/PCCGloable.dart';
import 'PCUDateButton.dart';
import 'PCUDateTile.dart';

class PCUSingleActionRoute extends StatefulWidget {
  PCUSingleActionRoute(
      {Key key,
      this.title,
      this.strActionTitle,
      this.actionCall,
      this.floatingCall,
      this.body})
      : super(key: key);
  final String title;
  final String strActionTitle;
  final VoidCallback actionCall;
  final VoidCallback floatingCall;
  final Widget body;
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
          title: PCUDateTile(widget.title),
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
            PCUDateButton(widget.strActionTitle, widget.actionCall),
          ],
        ),
        body: widget.body,
        floatingActionButton: FloatingActionButton(
          onPressed: widget.floatingCall,
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
