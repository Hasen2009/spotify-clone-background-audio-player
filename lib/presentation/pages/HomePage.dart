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
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: TweenAnimationBuilder(
        duration: Duration(milliseconds: 500),
        tween: EdgeInsetsTween(
            begin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            end: EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PickedList(),
              HorizontalPlayList(),
              HorizontalPlayList(),
              HorizontalPlayList(),
              HorizontalPlayList(),
            ],
          ),
        ),
        builder: (BuildContext _, EdgeInsets edgeInsets, Widget child) {
          return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: edgeInsets,
              child: child);
        },
      ),
    );
  }
}
