import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify2_app/logic/cubits/track_cubit.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/player_header.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/playlists_list.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify2_app/core/services/player_service.dart';
import 'package:spotify2_app/presentation/components/spinning_wheel.dart';

class PlayerScreen extends StatefulWidget {
  final playlist_id;

  PlayerScreen({this.playlist_id});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TrackCubit>(context).getTrack(widget.playlist_id);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Player'),
        leading: new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () async {
              await BlocProvider.of<TrackCubit>(context).close();
              Navigator.pop(context);
            }),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: BlocBuilder<TrackCubit, TrackState>(
        cubit: BlocProvider.of<TrackCubit>(context)..init(),
        builder: (context, state) {
          if (state is TrackLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is TrackLoaded) {
            return StreamBuilder<CurrentIndexState>(
                stream: PlayerService.getPlayerCurrentIndexState(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot?.data?.playerState?.processingState ==
                        AudioProcessingState.stopped) {
                      BlocProvider.of<TrackCubit>(context).close();
                      Navigator.pop(context);
                    }
                    // print(snapshot.data.mediaItem );
                    if(snapshot.data.mediaItem != null) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PlayerHeader(
                                mediaItem: snapshot.data.mediaItem,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              TrackPlaylist(
                                tracks: state.tracks,
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  }

                  return SpinningWheel();
                });
          }
          return Text('');
        },
      ),
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await PlayerService.dispose();
  }
}
