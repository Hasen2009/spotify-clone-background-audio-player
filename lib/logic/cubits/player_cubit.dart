import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part  'player_state.dart';
 class PlayerCubit extends Cubit<PlayerState>{
  PlayerCubit() : super(PlayerLoading());

  void init (){
    emit(PlayerLoading());
  }
  void minifyPlayer (){
    emit(PlayerMinify());
  }
  void UnMinifyPlayer (){
    emit(PlayerUnMinify());
  }
 }