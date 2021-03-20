import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify2_app/core/services/player_service.dart';
import 'package:spotify2_app/logic/cubits/playlist_cubit.dart';
import 'package:spotify2_app/logic/cubits/track_cubit.dart';

class VerticalPlaylistItem extends StatelessWidget {
  final String image_url;
  final String name;
  final String description;
  final String playlist_id;
  VerticalPlaylistItem({
    @required this.image_url,
    @required this.name,
    @required this.description,
    @required this.playlist_id
});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () async{
               Navigator.pushNamed(context, '/player',arguments: playlist_id);
            },
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(image_url),
            ),
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Align(
                  child: Text(name.trim().length > 20 ? name.trim().substring(1,20) : name.trim(),style: Theme.of(context).textTheme.headline6,),
                  alignment: Alignment.centerLeft,
                ),
              ),
              SizedBox(height: 5,),
              Container(height: 20,child: Text(description.trim().length > 30 ? description.trim().substring(1,30) + ' ...' : description.trim(),style: Theme.of(context).textTheme.subtitle2)),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.play_arrow,color: Theme.of(context).primaryColor,),
              Icon(Icons.pause,color: Theme.of(context).primaryColor,)
            ],
          ),
        )
      ],
    );
  }
}
