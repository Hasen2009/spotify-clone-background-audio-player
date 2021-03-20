import 'package:flutter/material.dart';
import 'package:spotify2_app/presentation/components/HomeComponents/HorizontalPlayList.dart';
import 'package:spotify2_app/presentation/components/HomeComponents/pickedList.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Good Afternoon'),
          backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          Icon(Icons.settings),
          SizedBox(width: 10,),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PickedList(),
              HorizontalPlayList(),
            ],
          ),
        ),
      ),
    );
  }
}
