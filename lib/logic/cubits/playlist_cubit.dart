
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify2_app/data/models/playlist_model.dart';
import 'package:spotify2_app/data/repositories/playlist_repository.dart';

part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState>{
  final PlaylistRepository playlistRepository = PlaylistRepository();
  PlaylistCubit() : super(PlaylistLoading());

  void getPlaylists()async {
    print('loaded !!');
    try{
      final playlistsFromRepo = await playlistRepository.getPlayListData();
      emit(PlaylistLoaded(playlists: playlistsFromRepo));
    }catch(e){
      emit(PlaylistError());
    }
  }

  void navigateToTacks(String id){
    emit(PlaylistRoute(id: id));
  }
}