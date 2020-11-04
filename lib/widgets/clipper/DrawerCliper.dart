import 'package:flutter/cupertino.dart';

class DrawerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - (size.height / 4.5));
    Offset endPoint1 = Offset(size.width, size.height - (size.height / 4.5));
    Offset curvePoint1 = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
      curvePoint1.dx,
      curvePoint1.dy,
      endPoint1.dx,
      endPoint1.dy,
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
