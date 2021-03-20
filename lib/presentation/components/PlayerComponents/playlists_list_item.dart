import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify2_app/core/constants/constants.dart';
import 'package:spotify2_app/core/services/player_service.dart';
import 'package:spotify2_app/presentation/screens/player_screen.dart';

import '../spinning_wheel.dart';

class TrackPlaylistsListItem extends StatelessWidget {
  final String image_url;
  final String artist_name;
  final String album_name;
  final String url;
  final int index;

  TrackPlaylistsListItem(
      {@required this.image_url,
      @required this.album_name,
      @required this.artist_name,
      @required this.url,
      @required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Container(
              width: 75.0,
              height: 75.0,
              child: Image.network(image_url),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: Text(
                album_name.trim(),
                style: Theme.of(context).textTheme.headline6,
              )),
              SizedBox(
                height: 5,
              ),
              Text(artist_name.trim(),
                  style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: StreamBuilder<CurrentIndexState>(
              stream: PlayerService.getPlayerCurrentIndexState(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.index == index) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (!snapshot.data.playerState.playing)
                        ?
                        IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: ()async {
                            await PlayerService.play();
                          },
                        )
                    :
                        IconButton(
                          icon: Icon(
                            Icons.pause,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: ()async {
                            await PlayerService.pause();
                          },
                        )
                      ],
                    );
                  }
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            await PlayerService.skipToTrack(index);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              color: Colors.green,
                              child: IconButton(
                                icon: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                                iconSize: 25,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }
                return SpinningWheel();
              }),
        )
      ],
    );
  }
}
