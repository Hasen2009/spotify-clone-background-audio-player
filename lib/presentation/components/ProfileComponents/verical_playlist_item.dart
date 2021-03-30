import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify2_app/core/services/player_service.dart';
import 'package:spotify2_app/logic/cubits/current_playlist_cubit.dart';
import 'package:spotify2_app/logic/cubits/player_cubit.dart';
import 'package:spotify2_app/logic/cubits/track_cubit.dart';

class VerticalPlaylistItem extends StatefulWidget {
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
  _VerticalPlaylistItemState createState() => _VerticalPlaylistItemState();
}

class _VerticalPlaylistItemState extends State<VerticalPlaylistItem> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation<Offset> _animation;

@override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
    _animation = Tween<Offset>(
      begin: const Offset(-0.5, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () async{
                 // Navigator.pushNamed(context, '/player',arguments: playlist_id);
                BlocProvider.of<TrackCubit>(context).init();
                BlocProvider.of<CurrentPlaylistCubit>(context).getCurrentPlaylist(widget.playlist_id);
                BlocProvider.of<PlayerCubit>(context).UnMinifyPlayer();

              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(widget.image_url),
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
                    child: Text(widget.name.trim().length > 20 ? widget.name.trim().substring(1,20) : widget.name.trim(),style: Theme.of(context).textTheme.headline6,),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                SizedBox(height: 5,),
                Container(height: 20,child: Text(widget.description.trim().length > 30 ? widget.description.trim().substring(1,30) + ' ...' : widget.description.trim(),style: Theme.of(context).textTheme.subtitle2)),
              ],
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.more_vert,color: Theme.of(context).primaryColor,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
