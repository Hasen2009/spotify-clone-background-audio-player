import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify2_app/logic/cubits/track_cubit.dart';
import 'package:spotify2_app/presentation/screens/player_screen.dart';

class PlayerScreenWrapper extends StatelessWidget {
  final String playlist_id;
  PlayerScreenWrapper({this.playlist_id});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>TrackCubit(),
      child: PlayerScreen(playlist_id: playlist_id,),
    );
  }
}
