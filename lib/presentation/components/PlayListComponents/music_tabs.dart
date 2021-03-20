import 'package:flutter/material.dart';
import 'package:spotify2_app/presentation/components/PlayListComponents/playlist_tab_view.dart';

class MusicTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            automaticallyImplyLeading: false,
            title: TabBar(
              indicatorColor: Colors.green,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: Theme.of(context).textTheme.subtitle1,
              // labelPadding: EdgeInsets.only(right: 20),
              unselectedLabelStyle: Theme.of(context).textTheme.subtitle2,
              isScrollable: true,
              tabs: [
                Tab(
                  text: "Playlist",
                ),
                Tab(text: "Albums"),
                Tab(text: "Singers"),
              ],

            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TabBarView(
              children: [
                PlaylistTabView(),
                PlaylistTabView(),
                PlaylistTabView(),

              ],
            ),
          ),
        ));
  }
}