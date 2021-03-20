import 'dart:convert';

import 'package:spotify2_app/data/dataproviders/spotify_dataprovider.dart';
import 'package:spotify2_app/data/models/playlist_model.dart';

class PlaylistRepository {
  SpotifyDataProvider spotifyDataProvider;

  Future getPlayListData()async {
    spotifyDataProvider = SpotifyDataProvider();
    // as I struggle with this issue "the method 'add' was called on null flutter"
    // after that I knew that flutter keep null value if you did not give it value

    List<PlaylistModel> playlists = [];

      final result = await spotifyDataProvider.getPlaylists();
      final resolvedData = json.decode(result.body);

      for(var el in resolvedData['playlists']){
          var playlist = PlaylistModel.fromJson(el);

          if(playlist != null){
            playlists.add(playlist);
          }

        }


      return playlists;
  }
}