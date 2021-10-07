import 'package:flutter/material.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({Key? key}) : super(key: key);
  static const routeName = '/tabbar';

  Widget getHomeTab() {
    return Center(
      child: Image.asset('assets/images/home.gif'),
    );
  }

  Widget getFavTab() {
    return Center(
      child: Image.asset('assets/images/favorite.gif'),
    );
  }

  Widget getSettingsTab() {
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
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home_filled,
                ),
                text: "HOME",
              ),
              Tab(
                icon: Icon(
                  Icons.favorite,
                ),
                text: "FAVORITE",
              ),
              Tab(
                icon: Icon(
                  Icons.settings,
                ),
                text: "SETTINGS",
              ),
            ],
          ),
          title: const Text('Tabs'),
        ),
        body: TabBarView(
          children: [
            getHomeTab(),
            getFavTab(),
            getSettingsTab(),
          ],
        ),
      ),
    );
  }
}
