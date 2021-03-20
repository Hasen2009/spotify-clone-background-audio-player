import 'package:flutter/material.dart';

class ProdcastsTabs extends StatelessWidget {
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
                  text: "Episodes",
                ),
                Tab(text: "Downloads"),
                Tab(text: "Shows"),
              ],
            ),
          ),
        ));
  }
}