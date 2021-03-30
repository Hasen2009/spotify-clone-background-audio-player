import 'package:flutter/material.dart';

class HorizontalPlayListItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  HorizontalPlayListItem({@required this.title,@required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image.network(imageUrl)),
        SizedBox(height: 10,),
        Text(title)
      ],
    );
  }
}
