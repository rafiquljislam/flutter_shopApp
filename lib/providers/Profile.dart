import 'package:flutter/cupertino.dart';

class Profile {
  final String id;
  final String name;
  final String backgroundImage;
  final String image;
  final int productAdd;
  final int orderd;

  Profile({
    @required this.id,
    @required this.name,
    @required this.backgroundImage,
    @required this.image,
    @required this.productAdd,
    @required this.orderd,
  });
}

class ProfileData with ChangeNotifier {
  Profile _user = Profile(
    id: "profile1",
    name: "MD Rafiqul Islam",
    backgroundImage: "assets/backgroundImage.jpg",
    image: "assets/profileImage.jpg",
    productAdd: 33,
    orderd: 44,
  );
  Profile get user {
    return _user;
  }
}
