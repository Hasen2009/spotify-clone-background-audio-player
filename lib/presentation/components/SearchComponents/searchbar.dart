import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Search",style: Theme.of(context).textTheme.headline4,),
        SizedBox(height: 20,),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Row(
              children: [
                Icon(Icons.search,color: Theme.of(context).accentColor,size: 30,),
                SizedBox(width: 10,),
                Text("Songs, Artist and Prodcasts.",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Theme.of(context).accentColor),)
              ],
            ),
          ),
        )],
    );
  }
}