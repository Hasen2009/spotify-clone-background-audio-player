import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
class PickedListItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  PickedListItem({@required this.title,@required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) ),
      ),
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) ),
            child: Image.network(imageUrl,width: 50,height: 50,),
          ),
          SizedBox(width: 20,),
          Text(title)
        ],
      ),
    );
  }
}
