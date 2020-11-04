import 'package:flutter/cupertino.dart';

class ProfileCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - (size.height / 4.5));
    Offset endPoint = Offset(size.width / 2, size.height - (size.height / 4));
    Offset centerPoint = Offset(size.width / 4, size.height);
    path.quadraticBezierTo(
      centerPoint.dx,
      centerPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );
    Offset endPoint2 = Offset(size.width, size.height - (size.height / 4));
    Offset centerPoint2 =
        Offset(size.width - (size.width / 4), size.height - (size.height / 2));
    path.quadraticBezierTo(
      centerPoint2.dx,
      centerPoint2.dy,
      endPoint2.dx,
      endPoint2.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
