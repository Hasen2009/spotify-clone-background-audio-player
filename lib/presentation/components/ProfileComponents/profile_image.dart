import 'package:flutter/material.dart';
import 'package:spotify2_app/core/constants/constants.dart';

class ProfileImage extends StatelessWidget {
  final String image_url;
  ProfileImage({this.image_url});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70,
      backgroundImage: NetworkImage(image_url),
    );
  }
}
