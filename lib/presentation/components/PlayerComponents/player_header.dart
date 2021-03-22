import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/song_image.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/song_slider.dart';

class PlayerHeader extends StatelessWidget {
  final MediaItem mediaItem;

  PlayerHeader({this.mediaItem});

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          (mediaItem.artUri != null)
              ? SongImage(image: mediaItem.artUri)
              : Text(''),
          SizedBox(
            height: 30,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                (mediaItem.album != null) ? mediaItem.album : 'album',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            height: 5,
          ),
          Text(
            (mediaItem.title != null) ? mediaItem.title : 'artist',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.grey[400]),
          ),
          SongSlider(),
        ],
      );

  }
}
