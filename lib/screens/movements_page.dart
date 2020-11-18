import 'package:flutter/material.dart';
import 'package:mymoney/controllers/movements_controller.dart';
import 'package:mymoney/models/movement.dart';

class MovementsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MovementsPageState();
}

class MovementsPageState extends State<MovementsPage> {

  List<Movement> movements = [];

  @override
  void initState() {
    super.initState();
    loadMovements();
  }

  void loadMovements() async {
    final _movements = await MovementsController().getMovements();
    setState(() => movements = _movements);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[900],
      ),
      margin: EdgeInsets.all(32),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: movements.length,
        itemBuilder: (context, index) => listItem(index),
      ),
    );
  }

  Widget listItem(index) {
    final day = movements.elementAt(index).date.day;
    final month = movements.elementAt(index).date.month;
    final year = movements.elementAt(index).date.year;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$ ${movements.elementAt(index).quantity}',
            style: TextStyle(color: Colors.white),
          ),
          Column(
            children: [
              Text(
                movements.elementAt(index).account,
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
}