import 'package:flutter/material.dart';
import 'package:mymoney/controllers/accounts_controller.dart';
import 'package:mymoney/controllers/movements_controller.dart';
import 'package:mymoney/custom/movement_dialog.dart';
import 'package:mymoney/custom/textfield.dart';
import 'package:mymoney/models/account.dart';
import 'package:mymoney/models/movement.dart';
import 'package:mymoney/screens/accounts_screen.dart';

class MovementsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MovementsPageState();
}

class MovementsPageState extends State<MovementsPage> with AutomaticKeepAliveClientMixin {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Movement> movements = [];

  @override
  void initState() {
    super.initState();
    loadMovements();
  }

  void loadMovements() async {
    final _movements = await MovementsController.getInstance().getMovements();
    setState(() => movements = _movements);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      key: _scaffoldKey,
      body: movements.isNotEmpty
        ? Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[900],
          ),
          margin: EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: movements.length,
              itemBuilder: (context, index) => listItem(index),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[850],
                thickness: 1,
              ),
            ),
          ),
        )
      : Center(
          child: Text(
            'No movements found',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 18
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final accounts = await AccountsController.getInstance().getAccounts();
          if(accounts.isNotEmpty) {
            await showDialog(
              context: context,
              builder: (context) => addMovementDialog(
                context,
                accounts,
                loadMovements
              )
            );
          } else {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('No money accounts found'),
              action: SnackBarAction(
                label: 'Go to Accounts',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AccountsScreen()
                  ));
                },
              ),
              backgroundColor: Colors.grey[850],
              elevation: 0,
            ));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget listItem(index) {
    final day = movements.elementAt(index).date.day;
    final month = movements.elementAt(index).date.month;
    final year = movements.elementAt(index).date.year;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$ ${movements.elementAt(index).quantity}',
            style: TextStyle(color: Colors.white),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                movements.elementAt(index).accountName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12
                ),
              ),
              Text(
                '$day/$month/$year',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  
  
  @override
  bool get wantKeepAlive => true;
}