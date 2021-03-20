import 'package:flutter/material.dart';
import 'package:spotify2_app/core/constants/constants.dart';
import 'package:spotify2_app/presentation/components/HomeComponents/pickedListItem.dart';

class PickedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 3.8,crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 20.0),
        itemCount: coverList.length,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return PickedListItem(imageUrl:coverList[index],title: 'Pop',);
        },
    );
  }
}
