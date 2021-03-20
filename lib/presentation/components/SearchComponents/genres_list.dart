import 'package:flutter/material.dart';
import 'package:spotify2_app/presentation/components/SearchComponents/genres_list_item.dart';

class GenresList extends StatelessWidget {
  final String genresTitle;
  final int totalItems;
  const GenresList({
    Key key,
    this.genresTitle,
    this.totalItems
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(genresTitle,style: TextStyle(color: Colors.white,fontSize: 20),),
        Flexible(
          child: GridView.builder(
            itemCount: totalItems,
            primary: false,
            padding: const EdgeInsets.only(top:20),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 2,crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 20.0),
            itemBuilder: (BuildContext context,int index){
              return GenresListItem(title: "Pop",);
            },
          ),
        )
      ],
    );
  }
}