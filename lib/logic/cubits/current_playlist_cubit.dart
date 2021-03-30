import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part  'current_playlist_state.dart';
class CurrentPlaylistCubit extends Cubit<CurrentPlaylistState>{
  CurrentPlaylistCubit() : super(CurrentLoading());

  void init (){
    emit(CurrentLoading());
  }
  void getCurrentPlaylist (String id){
    emit(CurrentLoaded(id: id));
  }
}