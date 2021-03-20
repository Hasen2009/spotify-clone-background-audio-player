part of'playlist_cubit.dart';

abstract class PlaylistState extends Equatable{}

class PlaylistLoading extends PlaylistState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class PlaylistLoaded extends PlaylistState{
  final List<PlaylistModel> playlists;
  PlaylistLoaded({this.playlists});
  @override
  // TODO: implement props
  List<Object> get props => [playlists];

}
class PlaylistRoute extends PlaylistState{
  final String id;
  PlaylistRoute({this.id});
  @override
  // TODO: implement props
  List<Object> get props => [id];
}

class PlaylistError extends PlaylistState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}