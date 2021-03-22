
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify2_app/core/services/player_service.dart';
import 'package:spotify2_app/data/models/track_model.dart';
import 'package:spotify2_app/data/repositories/track_repository.dart';

part 'track_state.dart';

class TrackCubit extends Cubit<TrackState> {
  final TrackRepository trackRepository = TrackRepository();
  TrackCubit() : super(TrackLoading());


  void init(){
    emit(TrackLoading());
  }
  void getTrack(String playlist_id)async{
    try{

      final tracksFromRepo = await trackRepository.getTracks(playlist_id);
      PlayerService.setPlaylist(tracksFromRepo);
      emit(TrackLoaded(tracks: tracksFromRepo));

    }catch(e){
      emit(TrackError());
    }
  }


}