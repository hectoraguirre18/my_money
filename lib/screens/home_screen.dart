import 'package:flutter/material.dart';
import 'package:mymoney/screens/movements_page.dart';
import 'package:mymoney/screens/stats_page.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        body: TabBarView(
          children: [
            MovementsPage(),
            StatsPage()
          ],
        ),
        bottomNavigationBar: Material(
          color: Color.lerp(
            Theme.of(context).scaffoldBackgroundColor,
            Colors.grey,
            0.1
          ),
          elevation: 4,
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.attach_money
                ),
                text: 'Movements',
              ),
              Tab(
                text: 'Stats',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}