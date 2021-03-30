import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:spotify2_app/core/services/player_service.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/song_image.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/song_slider.dart';

class PlayerHeader extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
      return StreamBuilder<MediaItem>(
        stream: PlayerService.getPlayerCurrentMediaItem(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Column(
              children: [
                (snapshot.data.artUri != null)
                    ? SongImage(image: snapshot.data.artUri)
                    : Text(''),
                SizedBox(
                  height: 30,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      (snapshot.data.album != null)
                          ? snapshot.data.album
                          : 'album',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline5,
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  (snapshot.data.title != null)
                      ? snapshot.data.title
                      : 'artist',
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.grey[400]),
                ),
                SongSlider(),
              ],
            );
          }
          return Text('');
        }
      );

  }
}
