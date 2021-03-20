import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SongImage extends StatelessWidget {
  final String image;
  SongImage({this.image});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 100,
        height: 200,
        child : FadeInImage.memoryNetwork(
          fit: BoxFit.fill,
          placeholder: kTransparentImage,
          image: image,
        )
      ),
    );
  }
}
