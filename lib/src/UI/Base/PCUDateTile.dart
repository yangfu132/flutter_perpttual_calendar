import 'package:flutter/material.dart';
import '../../Context/PCCGloable.dart';

class PCUDateTile extends StatelessWidget {
  const PCUDateTile(this.title, {super.key, Key? key});
  final String title;
  @override
  Widget build(BuildContext context) {
    double screenScale =
        MediaQuery.of(context).size.width / const_iPhone11_width;
    return Text(
      title,
      style: TextStyle(
        fontSize: 17 * screenScale,
        color: Color(int.parse(const_color_label)),
      ),
    );
  }
}
