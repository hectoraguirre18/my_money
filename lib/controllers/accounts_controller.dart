import 'package:mymoney/models/account.dart';

class AccountsController {
  Future<List<Account>> getAccounts() async {
    final accounts = <Account>[
      Account(
        name: 'Efectivo',
      ),
      Account(
        name: 'Tarjeta Bancomer',
      ),
    ];

    return accounts;
  }
}