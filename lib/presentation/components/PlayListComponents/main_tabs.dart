import 'package:flutter/material.dart';
import 'package:spotify2_app/presentation/components/PlayListComponents/prodcast_tabs.dart';
import 'package:spotify2_app/presentation/components/PlayListComponents/music_tabs.dart';

class MainTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.only(top: 20),
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).backgroundColor,
              automaticallyImplyLeading: false,
              title: TabBar(
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: Theme.of(context).textTheme.headline5,
                unselectedLabelStyle: Theme.of(context).textTheme.headline6,
                isScrollable: true,
                tabs: [
                  Tab(
                    text: "Music",
                  ),
                  Tab(text: "Prodcast"),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                MusicTabs(),
                ProdcastsTabs(),
              ],
            ),
          )),
    );
  }
}
