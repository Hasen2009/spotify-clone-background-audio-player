import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify2_app/core/services/player_service.dart';
import 'package:spotify2_app/logic/cubits/player_cubit.dart';

import '../spinning_wheel.dart';

class MiniPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MediaItem>(
        stream: PlayerService.getPlayerCurrentMediaItem(),
        builder: (context, snapshotMedia) {
          if(snapshotMedia.hasData){
            return Container(
                height: 80,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  color: Colors.black87,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 7,
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<PlayerCubit>(context)
                              .UnMinifyPlayer();
                        },
                        child: Container(
                          height: 80,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Row(
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
                                    child: (snapshotMedia?.data?.artUri != null)
                                        ? Image.network(
                                        snapshotMedia.data.artUri)
                                        : SizedBox(
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                        child: FittedBox(
                                          fit: BoxFit.fill,
                                          child: Text(
                                            (snapshotMedia?.data?.album != null)
                                                ? snapshotMedia.data.album.trim()
                                                : 'album',
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        (snapshotMedia?.data?.title != null)
                                            ? snapshotMedia.data.title.trim()
                                            : 'artist',
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .subtitle2),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: StreamBuilder<CurrentIndexState>(
                          stream: PlayerService.getPlayerCurrentIndexState(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {

                              if (snapshot?.data?.mediaItem?.id ==
                                  snapshotMedia?.data?.id) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    (!snapshot?.data?.playerState?.playing)
                                        ? GestureDetector(
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: Theme
                                            .of(context)
                                            .primaryColor,
                                      ),
                                      onTap: () async {
                                        await PlayerService.play();
                                      },
                                    )
                                        : GestureDetector(
                                      child: Icon(
                                        Icons.pause,
                                        color: Theme
                                            .of(context)
                                            .primaryColor,
                                      ),
                                      onTap: () async {
                                        await PlayerService.pause();
                                      },
                                    )
                                  ],
                                );
                              }
                            }
                            return SpinningWheel();
                          }),
                    )
                  ],
                )

            );
          }
          return Text('');
        });
  }
}
