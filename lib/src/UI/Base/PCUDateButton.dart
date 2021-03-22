import 'package:flutter/material.dart';
import '../../Context/PCCGloable.dart';

class PCUDateButton extends StatelessWidget {
  PCUDateButton(this.title, this.onPress, {Key? key});
  final String title;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    double _screenScale =
        MediaQuery.of(context).size.width / const_iPhone11_width;
    return FlatButton(
      onPressed: this.onPress,
      child: Text(
        this.title,
        style: TextStyle(
          fontSize: 15 * _screenScale,
          color: Color(int.parse(const_color_action)),
        ),
      ),
    );
  }
}
