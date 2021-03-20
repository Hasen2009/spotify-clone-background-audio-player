import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){},
      child: Text('Edit Profile',style:Theme.of(context).textTheme.subtitle2 ,),
      padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey[600]),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
