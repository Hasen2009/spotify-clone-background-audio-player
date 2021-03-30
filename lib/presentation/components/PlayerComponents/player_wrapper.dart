import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify2_app/core/services/player_service.dart';
import 'package:spotify2_app/logic/cubits/current_playlist_cubit.dart';
import 'package:spotify2_app/logic/cubits/track_cubit.dart';
import 'package:spotify2_app/presentation/screens/player_screen.dart';
import 'package:spotify2_app/logic/cubits/player_cubit.dart';

class PlayerScreenWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentPlaylistCubit,CurrentPlaylistState>(
        builder: (context, state) {
          if(state is CurrentLoaded) {
            BlocProvider.of<TrackCubit>(context).getTrack(state.id);
            return PlayerScreen();
          }
          return Text('');
        }
    );

  }
}
