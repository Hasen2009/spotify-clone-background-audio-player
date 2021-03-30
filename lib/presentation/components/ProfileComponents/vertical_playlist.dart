import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify2_app/logic/cubits/playlist_cubit.dart';
import 'package:spotify2_app/presentation/components/ProfileComponents/verical_playlist_item.dart';

class VerticalPlaylist extends StatefulWidget {
  @override
  _VerticalPlaylistState createState() => _VerticalPlaylistState();
}

class _VerticalPlaylistState extends State<VerticalPlaylist> {
  @override
  void initState() {
    BlocProvider.of<PlaylistCubit>(context).getPlaylists();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistCubit,PlaylistState>(
      builder:(context,state) {
        if(state is PlaylistLoading){
          return Center(child: CircularProgressIndicator());
        }
        if(state is PlaylistLoaded){
          return ListView.separated(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            separatorBuilder: (context,index)=>SizedBox(height: 10,),
            itemCount: state.playlists.length,
            itemBuilder: (context,index){
              final playlist = state.playlists[index];
              return VerticalPlaylistItem(image_url: playlist.image,name:playlist.name ,description: playlist.description,playlist_id: playlist.playlist_id,);
            },
          );
        }
        return Text('');
      },
    );
  }
}

