import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:spotify2_app/presentation/screens/HomeScreen.dart';


class AppRoute {
  static Route onGenerateRoute(RouteSettings settings){
    final name = settings.name;
     switch(name){
       case '/':
         return _materialRoute(AudioServiceWidget(child: HomeScreen()));
       default :
         return null;
     }
  }

  static Route _materialRoute(view){
    return MaterialPageRoute(builder: (context)=>view);
  }
}
