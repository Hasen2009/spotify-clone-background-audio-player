import 'package:flutter/material.dart';
import 'package:spotify2_app/presentation/components/ProfileComponents/profile_statics_item.dart';

class ProfileStatics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfileStaticsItem(title: 'Followers',static: 65,),
        ProfileStaticsItem(title: 'Following',static: 23,),
        ProfileStaticsItem(title: 'Likes',static: 653,),
      ],
    );
  }
}
