import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify2_app/core/routes/route.dart';
import 'package:spotify2_app/core/themes/appTheme.dart';
import 'package:spotify2_app/logic/cubits/playlist_cubit.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider<PlaylistCubit>(create: (BuildContext context)=>PlaylistCubit()),
    //     BlocProvider<TrackCubit>(create: (BuildContext context)=>TrackCubit())
    //   ],
    //   child: MaterialApp(
    //     initialRoute: '/',
    //     onGenerateRoute: AppRoute.onGenerateRoute,
    //     theme: AppTheme.light,
    //   ),
    // );
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
