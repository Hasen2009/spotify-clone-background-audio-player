import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify2_app/logic/cubits/track_cubit.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/player_header.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/playlists_list.dart';
import 'package:spotify2_app/logic/cubits/player_cubit.dart';

class FullPlayer extends StatelessWidget {
  const FullPlayer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 56,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Player'),
          leading: new IconButton(
              icon: new Icon(Icons.close),
              onPressed: () async {
                // await BlocProvider.of<TrackCubit>(context).close();
                // Navigator.pop(context);
                BlocProvider.of<PlayerCubit>(context).minifyPlayer();
              }),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: BlocBuilder<TrackCubit, TrackState>(
          // cubit: BlocProvider.of<TrackCubit>(context)..init(),
          builder: (context, state) {
            print(state);
            if (state is TrackLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is TrackLoaded) {
              return Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PlayerHeader(),
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
            return Text('');
          },
        ),
      ),
    );
  }
}