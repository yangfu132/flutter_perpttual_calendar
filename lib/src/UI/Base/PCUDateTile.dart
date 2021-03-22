import 'package:flutter/material.dart';
import '../../Context/PCCGloable.dart';

class PCUDateTile extends StatelessWidget {
  PCUDateTile(this.title, {Key?/*!*/ key});
  final String title;
  @override
  Widget build(BuildContext context) {
    double _screenScale =
        MediaQuery.of(context).size.width / const_iPhone11_width;
    return Text(
      this.title!,
      style: TextStyle(
        fontSize: 17 * _screenScale,
        color: Color(int.parse(const_color_label)),
      ),
    );
  }
}
