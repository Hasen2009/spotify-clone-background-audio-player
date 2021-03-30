
import 'package:flutter/material.dart';
import 'package:spotify2_app/core/services/player_service.dart';

import '../spinning_wheel.dart';

class TrackPlaylistsListItem extends StatelessWidget {
  final String image_url;
  final String artist_name;
  final String album_name;
  final String url;

  TrackPlaylistsListItem({
    @required this.image_url,
    @required this.album_name,
    @required this.artist_name,
    @required this.url,
  });

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
        SizedBox(width: 20,),
        Expanded(
          flex: 1,
          child: StreamBuilder<CurrentIndexState>(
              stream: PlayerService.getPlayerCurrentIndexState(),
              builder: (context, snapshot) {
                if (snapshot.hasData ) {
                  if (snapshot?.data?.mediaItem?.id == url) {
                    return (!snapshot.data.playerState.playing)
                        ? IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () async {
                        await PlayerService.play();
                      },
                    )
                        : IconButton(
                      icon: Icon(
                        Icons.pause,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () async {
                        await PlayerService.pause();
                      },
                    );
                  }
                  return GestureDetector(
                    onTap: () async {
                      await PlayerService.skipToTrack(url);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      child: Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(4),
                        color: Colors.green,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  );
                }
                return SpinningWheel();
              }),
        )
      ],
    );
  }
}
