part of'playlist_cubit.dart';

abstract class PlaylistState extends Equatable{}

class PlaylistLoading extends PlaylistState {
  @override
  List<Object> get props => [];
}

class PlaylistLoaded extends PlaylistState{
  final List<PlaylistModel> playlists;
  PlaylistLoaded({this.playlists});
  @override
  List<Object> get props => [playlists];

}

class PlaylistError extends PlaylistState{
  @override
  List<Object> get props => [];
}