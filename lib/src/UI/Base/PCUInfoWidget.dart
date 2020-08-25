import 'package:flutter/material.dart';
import '../../Context/PCCGloable.dart';

class PCUInfoWidget extends StatelessWidget {
  PCUInfoWidget(this.title, {Key key});
  final String title;
  @override
  Widget build(BuildContext context) {
    double _screenScale =
        MediaQuery.of(context).size.width / const_iPhone11_width;
    return Text(
      this.title,
      style: TextStyle(color: Colors.grey, fontSize: 13 * _screenScale),
    );
  }
}
