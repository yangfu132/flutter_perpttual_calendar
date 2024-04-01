import 'package:flutter/material.dart';

import '../../Context/PCCGloable.dart';

class PCUDateButton extends StatelessWidget {
  const PCUDateButton(this.title, this.onPress, {super.key});
  final String title;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    double screenScale =
        MediaQuery.of(context).size.width / const_iPhone11_width;
    return TextButton(
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15 * screenScale,
          color: Color(int.parse(const_color_action)),
        ),
      ),
    );
  }
}
