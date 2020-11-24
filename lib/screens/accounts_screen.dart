import 'package:flutter/material.dart';
import 'package:mymoney/controllers/accounts_controller.dart';
import 'package:mymoney/models/account.dart';

class AccountsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AccountsScreenState();
}

class AccountsScreenState extends State<AccountsScreen> with AutomaticKeepAliveClientMixin {

  List<Account> accounts = [];

  @override
  void initState() {
    super.initState();
    loadAccounts();
  }

  void loadAccounts() async {
    final _accounts = await AccountsController().getAccounts();
    setState(() => accounts = _accounts);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[900],
        ),
        margin: EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: accounts.length,
            itemBuilder: (context, index) => listItem(index),
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey[850],
              thickness: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget listItem(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: Row(
        children: [
          Text(
            accounts.elementAt(index).name,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}