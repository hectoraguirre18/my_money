import 'package:mymoney/models/movement.dart';
import 'package:mymoney/services/database_service.dart';

class MovementsController {

  static const _recordName = 'movements';

  MovementsController._();
  static MovementsController _instance;

  static MovementsController getInstance() {
    if(_instance == null) {
      _instance = MovementsController._();
    }
    return _instance;
  }

  Future<List<Movement>> getMovements() async {
    final db = await LocalDatabaseService.getInstance();
    final result = await db.get(_recordName) as List;

    print('result: $result');

    return result?.map((m) => Movement.fromMap(m))?.toList() ?? [];
  }

  Future<dynamic> saveMovement(Movement movement) async {
    final db = await LocalDatabaseService.getInstance();
    await db.append(_recordName, movement.toMap());
  }
}