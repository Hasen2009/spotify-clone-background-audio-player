import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify2_app/core/routes/route.dart';
import 'package:spotify2_app/core/services/player_service.dart';
import 'package:spotify2_app/core/themes/app_theme.dart';
import 'package:spotify2_app/logic/cubits/playlist_cubit.dart';
import 'package:spotify2_app/logic/cubits/player_cubit.dart';
import 'package:spotify2_app/logic/cubits/track_cubit.dart';
import 'package:spotify2_app/presentation/screens/PlayerScreen.dart';


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
              }else{
                return PlayerScreen();
              }
            }
            return Text('');
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
        BlocProvider<TrackCubit>(create: (BuildContext context)=>TrackCubit())
      ],
      child: MaterialApp(
        initialRoute: '/',
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

  }
}
