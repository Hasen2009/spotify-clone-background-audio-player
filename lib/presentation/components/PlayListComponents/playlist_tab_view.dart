import 'package:flutter/material.dart';
import 'package:spotify2_app/presentation/components/HomeComponents/pickedList.dart';
import 'file:///C:/Users/hussein/AndroidStudioProjects/spotify2_app/lib/presentation/components/PlayerComponents/playlists_list.dart';
import 'package:spotify2_app/presentation/components/ProfileComponents/vertical_playlist.dart';

class PlaylistTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20,),
          CreateButton(),
          VerticalPlaylist()
        ],
      ),
    );
  }
}
class CreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Container(
                    color: Colors.grey[800],
                    width: 75.0,
                    height: 75.0,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'Create Playlist',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
