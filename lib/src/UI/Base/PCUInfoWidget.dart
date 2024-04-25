import 'package:flutter/material.dart';
import '../../Context/PCCGloable.dart';

class PCUInfoWidget extends StatelessWidget {
  const PCUInfoWidget(this.title, {super.key/*, Key? key*/});
  final String title;
  @override
  Widget build(BuildContext context) {
    double screenScale =
        MediaQuery.of(context).size.width / const_iPhone11_width;
    return Text(
      title,
      style: TextStyle(color: Colors.grey, fontSize: 13 * screenScale),
    );
  }
}
