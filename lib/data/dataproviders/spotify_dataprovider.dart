import 'package:spotify2_app/core/constants/constants.dart';
import 'package:http/http.dart' as http;
class SpotifyDataProvider {
  Future<http.Response> getPlaylists()async{
    final results = await http.get("https://api.napster.com/v2.0/playlists?apikey=${api_key}");
    
    if(results.statusCode != 200){
      throw Exception();
    }
    return results;
  }
  Future<http.Response> getTracks(String playlist_id) async{
    final results = await http.get("https://api.napster.com/v2.0/playlists/${playlist_id}/tracks?limit=20&apikey=${api_key}");
    if(results.statusCode != 200){
      throw Exception();
    }
    return results;
  }
}