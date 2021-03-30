part of 'current_playlist_cubit.dart';
abstract class CurrentPlaylistState extends Equatable {}

class CurrentLoading extends CurrentPlaylistState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class CurrentLoaded extends CurrentPlaylistState{
  final String id;
  CurrentLoaded({this.id});
  @override
  // TODO: implement props
  List<Object> get props => [id];
}