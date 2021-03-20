import 'package:flutter/material.dart';

class ProfileStaticsItem extends StatelessWidget {
  final String title;
  final int static;
  ProfileStaticsItem({@required this.title,@required this.static});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(static.toString(),style: Theme.of(context).textTheme.subtitle1,),
        Text(title,style: Theme.of(context).textTheme.subtitle2,)
      ],
    );
  }
}
