import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify2_app/core/routes/route.dart';
import 'package:spotify2_app/core/services/player_service.dart';
import 'package:spotify2_app/core/themes/appTheme.dart';
import 'package:spotify2_app/logic/cubits/current_playlist_cubit.dart';
import 'package:spotify2_app/logic/cubits/playlist_cubit.dart';
import 'package:spotify2_app/logic/cubits/player_cubit.dart';
import 'package:spotify2_app/logic/cubits/track_cubit.dart';

import 'components/PlayerComponents/player_wrapper.dart';
// return StreamBuilder<PlaybackState>(
//     stream: PlayerService.getPlayerStateStream(),
//     builder: (context, snapshot) {
//       print(snapshot.data.processingState);
//       // if(snapshot.hasData){
//       //   print(snapshot.data.processingState);
//       //   // if(snapshot.data.processingState == AudioProcessingState.stopped){
//       //   //   BlocProvider.of<TrackCubit>(context).init();
//       //   //   BlocProvider.of<CurrentPlaylistCubit>(context).init();
//       //   //   BlocProvider.of<PlayerCubit>(context).minifyPlayer();
//       //   // }
//       // }
//       return BlocBuilder<CurrentPlaylistCubit,CurrentPlaylistState>(
//           builder: (context, state) {
//             if(state is CurrentLoaded) {
//               BlocProvider.of<TrackCubit>(context).getTrack(state.id);
//               return PlayerScreen();
//             }
//             return Text('');
//           }
//       );
//     });

class App extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  void showOverlay(BuildContext context) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        bottom: 56,
        right: 0,
        child: StreamBuilder<bool>(
          stream: PlayerService.getPlayerRunningState(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              if(snapshot.data == false){
                BlocProvider.of<TrackCubit>(context).init();
                BlocProvider.of<PlayerCubit>(context).minifyPlayer();
                BlocProvider.of<CurrentPlaylistCubit>(context).init();
              }
            }
            return PlayerScreenWrapper();
          }
        ),
      );
    });
    overlayState.insert(overlayEntry);
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlaylistCubit>(create: (BuildContext context)=>PlaylistCubit()),
        BlocProvider<PlayerCubit>(create: (BuildContext context)=>PlayerCubit()),
        BlocProvider<CurrentPlaylistCubit>(create: (BuildContext context)=>CurrentPlaylistCubit()),
        BlocProvider<TrackCubit>(create: (BuildContext context)=>TrackCubit())
      ],
      child: MaterialApp(
        initialRoute: '/',
        // onGenerateRoute: AppRoute.onGenerateRoute,
        theme: AppTheme.light,
        home: WillPopScope(
          onWillPop: () async => !await _navigatorKey.currentState.maybePop(),
          child: LayoutBuilder(
            builder: (context,constraints){
              WidgetsBinding.instance.addPostFrameCallback((_) => showOverlay(context));
              return Navigator(
                key: _navigatorKey,
                onGenerateRoute:AppRoute.onGenerateRoute ,
              );
            },
          ),
        ),
      ),
    );
    return BlocProvider(
      create: (BuildContext context)=>PlaylistCubit(),
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: AppRoute.onGenerateRoute,
        theme: AppTheme.light,
      ),
    );
  }
}
