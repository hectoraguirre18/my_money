import 'package:flutter/material.dart';
import 'package:mymoney/drawers/home_drawer.dart';
import 'package:mymoney/screens/movements_page.dart';
import 'package:mymoney/screens/stats_page.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        drawer: HomeDrawer(),
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
                icon: Icon(
                  Icons.bar_chart
                ),
                text: 'Stats',
              ),
            ],
          ),
        ),
      ),
    );
  }
}