import 'package:flutter/material.dart';
import 'package:spotify2_app/data/models/track_model.dart';
import 'package:spotify2_app/presentation/components/PlayerComponents/track_playlist_item.dart';

class TrackPlaylist extends StatefulWidget {
  final List<TrackModel> tracks;
  TrackPlaylist({this.tracks});
  @override
  _TrackPlaylistState createState() => _TrackPlaylistState();
}

class _TrackPlaylistState extends State<TrackPlaylist> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      separatorBuilder: (context,index)=>SizedBox(height: 10,),
      itemCount: widget.tracks.length,
      itemBuilder: (context,index){
        final track = widget.tracks[index];
        return TrackPlaylistsListItem(image_url:track.image,album_name: track.album_name,artist_name: track.artist_name,url: track.url,);
      },
    );;
  }


}
