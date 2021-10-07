import 'package:flutter/material.dart';

class TabbarScreen extends StatelessWidget {
  const TabbarScreen({Key? key}) : super(key: key);
  static const routeName = '/tabs';

  Widget getHomeContent() {
    return Center(
      child: Image.asset('assets/images/home.gif'),
    );
  }

  Widget getFavoriteContent() {
    return Center(
      child: Image.asset('assets/images/favorite.gif'),
    );
  }

  Widget getSettingsContent() {
    return Center(
      child: Image.asset('assets/images/settings.gif'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tabs'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home_filled),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              ),
              Tab(
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          getHomeContent(),
          getFavoriteContent(),
          getSettingsContent(),
        ]),
      ),
    );
  }
}
