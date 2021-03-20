import 'package:flutter/material.dart';
import 'package:spotify2_app/core/services/player_service.dart';
import 'package:spotify2_app/data/models/track_model.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/song_image.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/song_slider.dart';

class PlayerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SongImage(image : "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1276&q=80"),
        SizedBox(height: 30,),
        Align(alignment: Alignment.center,child: Text('track.album_name',style: Theme.of(context).textTheme.headline5,textAlign: TextAlign.center,)),
        SizedBox(height: 5,),
        Text('track.artist_name',style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.grey[400]),),
        SongSlider(),
      ],
    );
  }
}
