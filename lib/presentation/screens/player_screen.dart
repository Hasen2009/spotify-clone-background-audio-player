import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify2_app/logic/cubits/current_playlist_cubit.dart';
import 'package:spotify2_app/logic/cubits/track_cubit.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/full_player.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/mini_player.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/player_header.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/playlists_list.dart';
import 'package:spotify2_app/core/services/player_service.dart';
import 'package:spotify2_app/presentation/components/spinning_wheel.dart';
import 'package:spotify2_app/logic/cubits/player_cubit.dart';

class PlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerCubit, PlayerState>(
      builder: (context, state) {
        return AnimatedCrossFade(
          firstChild: FullPlayer(),
          secondChild: MiniPlayer(),
          crossFadeState: (state is PlayerUnMinify)
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 500),
        );
        // if (state is PlayerUnMinify) {
        //   return FullPlayer();
        // }
        // if (state is PlayerMinify) {
        //   return MiniPlayer();
        // }
        // return SpinningWheel();
      },
    );
  }
}
