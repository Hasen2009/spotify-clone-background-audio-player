import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/player_wrapper.dart';
import 'package:spotify2_app/presentation/screens/HomeScreen.dart';


class AppRoute {
  static Route onGenerateRoute(RouteSettings settings){
    final name = settings.name;
    final args = settings.arguments;
     switch(name){
       case '/':
         return _materialRoute(AudioServiceWidget(child: HomeScreen()));
       // case '/player' :
       //   print(args);
       //   return _materialRoute(PlayerScreenWrapper(playlist_id: args,));
       default :
         return null;
     }
  }

  static Route _materialRoute(view){
    return MaterialPageRoute(builder: (context)=>view);
  }
}
