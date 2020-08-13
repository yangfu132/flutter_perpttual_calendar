import 'package:flutter/material.dart';
import 'PerpttualCalendarWidget.dart';

class PCUSelectDateRoute extends StatefulWidget {
  PCUSelectDateRoute({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _PCUSelectDateRouteState createState() => _PCUSelectDateRouteState();
}

class _PCUSelectDateRouteState extends State<PCUSelectDateRoute> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double iphone11Width = 414;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenScale = screenWidth / iphone11Width;
    Color _defaultColor = Color(0xFF6F6F6F);
    Color _btnColor = Color(0xFF176ADA);
    return Theme(
      data: ThemeData(primaryColor: Colors.white),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 17 * screenScale,
              color: _defaultColor,
            ),
          ),
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 50,
            ),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: _btnColor,
                iconSize: 20 * screenScale,
                onPressed: () {}),
          ),
          actions: [
            FlatButton(
              onPressed: () {},
              child: Text(
                '重置',
                style: TextStyle(
                  fontSize: 15 * screenScale,
                  color: _btnColor,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 15.0,
            top: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    '时间：',
                    style: TextStyle(
                      fontSize: 17 * screenScale,
                      color: _defaultColor,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      '请选择日期',
                      style: TextStyle(
                        fontSize: 15 * screenScale,
                        color: _btnColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '月    ：',
                    style: TextStyle(
                      fontSize: 17 * screenScale,
                      color: _defaultColor,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      '请选择月之天干',
                      style: TextStyle(
                        fontSize: 15 * screenScale,
                        color: _btnColor,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      '请选择月之地支',
                      style: TextStyle(
                        fontSize: 15 * screenScale,
                        color: _btnColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '日    ：',
                    style: TextStyle(
                      fontSize: 17 * screenScale,
                      color: _defaultColor,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      '请选择日之天干',
                      style: TextStyle(
                        fontSize: 15 * screenScale,
                        color: _btnColor,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      '请选择日之地支',
                      style: TextStyle(
                        fontSize: 15 * screenScale,
                        color: _btnColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          backgroundColor: Colors.white,
          tooltip: 'Increment',
          child: Icon(
            Icons.add,
            color: _btnColor,
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
