
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spotify2_app/presentation/components/PlayerComponents/full_player.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/mini_player.dart';

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
      },
    );
  }
}
