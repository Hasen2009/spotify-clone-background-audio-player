

import 'package:flutter/material.dart';
import 'package:spotify2_app/core/constants/constants.dart';
import 'package:spotify2_app/presentation/components/ProfileComponents/edit_profile.dart';
import 'package:spotify2_app/presentation/components/ProfileComponents/profile_image.dart';
import 'package:spotify2_app/presentation/components/ProfileComponents/profile_statics.dart';
import 'package:spotify2_app/presentation/components/ProfileComponents/vertical_playlist.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileImage(image_url : image_profile),
          SizedBox(height: 20,),
          Text("Hussein Shabib",style: Theme.of(context).textTheme.headline4,),
          SizedBox(height: 10,),
          EditProfile(),
          SizedBox(height: 30,),
          ProfileStatics(),
          SizedBox(height: 30,),
          Text("Your List",style: Theme.of(context).textTheme.headline5,),
          SizedBox(height: 15,),
          VerticalPlaylist(),
          SizedBox(height: 80,),

        ],
          ),
      ),
    );
  }
}
