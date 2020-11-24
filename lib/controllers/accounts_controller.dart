import 'package:mymoney/models/account.dart';
import 'package:mymoney/services/database_service.dart';

class AccountsController {

  static const _recordName = 'moneyaccounts';

  AccountsController._();
  static AccountsController _instance;

  static AccountsController getInstance() {
    if(_instance == null) {
      _instance = AccountsController._();
    }
    return _instance;
  }

  Future<List<Account>> getAccounts() async {
    final db = await LocalDatabaseService.getInstance();
    final result = await db.get(_recordName) as List;

    print('result: $result');

    return result?.map((m) => Account.fromMap(m))?.toList() ?? [];
  }

  Future<dynamic> saveAccount(Account account) async {
    final db = await LocalDatabaseService.getInstance();
    await db.append(_recordName, account.toMap());
  }
}