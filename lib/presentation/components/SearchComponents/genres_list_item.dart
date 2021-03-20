import 'dart:math';

import 'package:flutter/material.dart';

class GenresListItem extends StatelessWidget {
  final String title;
  GenresListItem({this.title,});
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
          borderRadius: BorderRadius.circular(5)
      ),
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        style : Theme.of(context).textTheme.headline6.copyWith(shadows: <Shadow>[
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 3.0,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 8.0,
            color: Color.fromARGB(125, 0, 0, 255),
          ),
        ])
      ),
    );
  }
}
