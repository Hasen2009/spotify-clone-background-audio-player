import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify2_app/core/constants/constants.dart';
import 'package:spotify2_app/presentation/components/HomeComponents/HorizontalPlayListItem.dart';
class HorizontalPlayList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recently Songs',style: Theme.of(context).textTheme.headline6,),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(
              separatorBuilder:(BuildContext context,index)=>SizedBox(width: 15,) ,
              itemCount: coverList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index){
                return HorizontalPlayListItem(imageUrl: coverList[index],title: 'Wave your hips',);
              }
              ),
          ),
        ],
      ),
    );
  }
}
