import 'dart:convert';

import 'package:spotify2_app/data/dataproviders/spotify_dataprovider.dart';
import 'package:spotify2_app/data/models/track_model.dart';

class TrackRepository {
  SpotifyDataProvider spotifyDataProvider;

  Future<List<TrackModel>> getTracks(String playlist_id)async {
    spotifyDataProvider = SpotifyDataProvider();
    List<TrackModel> tracks = [];

    try{
      final results = await spotifyDataProvider.getTracks(playlist_id);
      final resolvedData = json.decode(results.body);
      for (var i = 0; i < resolvedData['tracks'].length; i++) {
        final track = TrackModel.fromJson(resolvedData['tracks'][i]);
        tracks.add(track);
      }
      return tracks;
    }catch(e){
      return e;
    }
  }
}