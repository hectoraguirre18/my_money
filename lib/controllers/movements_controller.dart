import 'dart:io';

import 'package:mymoney/models/movement.dart';

class MovementsController {
  Future<List<Movement>> getMovements() async {
    final movements = <Movement>[
      Movement(
        quantity: 500.0,
        accountID: 'Efectivo',
        date: DateTime.now()
      ),
      Movement(
        quantity: 200.0,
        accountID: 'Efectivo',
        date: DateTime.now()
      ),
      Movement(
        quantity: 3.0,
        accountID: 'Efectivo',
        date: DateTime.now()
      ),
      Movement(
        quantity: 600.0,
        accountID: 'Efectivo',
        date: DateTime.now()
      ),
    ];

    return movements;
  }
}