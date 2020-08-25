import 'package:flutter/material.dart';

class PCUTriangleWidget extends StatefulWidget {
  PCUTriangleWidget({@required this.width, @required this.height, this.child});
  final double width;
  final double height;
  final Widget child;
  @override
  State<StatefulWidget> createState() {
    return _PCUTriangleWidgetState();
  }
}

class _PCUTriangleWidgetState extends State<PCUTriangleWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipPath(
          clipper: TopClipper(widget.width, widget.height),
          child: Container(
            // 主题色填充 child
            width: widget.width,
            height: widget.height,
            color: Theme.of(context).primaryColor,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}

/// 顶部斜对角栏裁剪
class TopClipper extends CustomClipper<Path> {
  /// 构造函数，接收传递过来的宽高
  TopClipper(this.width, this.height);
  double width;
  double height;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(width, height);
    path.lineTo(width, 0.0);
    path.close();
    return path;
  }

  /// 接口决定是否重新剪裁
  /// 如果在应用中，剪裁区域始终不会发生变化时应该返回 false，这样就不会触发重新剪裁，避免不必要的性能开销。
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
