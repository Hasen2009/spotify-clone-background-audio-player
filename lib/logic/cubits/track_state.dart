part of "track_cubit.dart";
abstract class TrackState extends Equatable {}

class TrackLoading extends TrackState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TrackLoaded extends TrackState{
  final List<TrackModel> tracks;
  TrackLoaded({this.tracks});

  @override
  List<Object> get props => [tracks];
}

class TrackError extends TrackState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}