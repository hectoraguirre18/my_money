import 'package:flutter/material.dart';
import 'package:mymoney/controllers/accounts_controller.dart';
import 'package:mymoney/custom/textfield.dart';
import 'package:mymoney/models/account.dart';

class AccountsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AccountsScreenState();
}

class AccountsScreenState extends State<AccountsScreen> {

  List<Account> accounts = [];

  @override
  void initState() {
    super.initState();
    loadAccounts();
  }

  Future<dynamic> loadAccounts() async {
    final _accounts = await AccountsController.getInstance().getAccounts();
    setState(() => accounts = _accounts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: accounts.isNotEmpty
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
                itemCount: accounts.length,
                itemBuilder: (context, index) => listItem(index),
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[850],
                  thickness: 1,
                  height: 1,
                ),
              ),
            ),
          )
        : Center(
          child: Text(
            'No accounts found',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 18
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => addAccountDialog(context)
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget listItem(index) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
          child: Row(
            children: [
              Text(
                accounts.elementAt(index).name,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AlertDialog addAccountDialog(context) {
    final _formKey = GlobalKey<FormState>();

    String _name;

    void validateForm() async {
      if(_formKey.currentState.validate()) {
        final controller = AccountsController.getInstance();
        await controller.saveAccount(Account(name: _name));
        await loadAccounts();
        Navigator.pop(context);
      }
    }

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.symmetric(horizontal: 12),
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      title: Container(
        child: Center(
          child: Text(
            'Add Account',
            style: TextStyle(
              color: Colors.white
            ),
          )
        ),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )
        ),
      ),
      backgroundColor: Colors.grey[850],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      content: Form(
        key: _formKey,
        child: CustomTextField(
          hint: 'Name',
          fillColor: Colors.grey[900],
          textInputAction: TextInputAction.done,
          validator: (String value) {
            _name = value;
            if (value == null || value.isEmpty)
              return 'Este campo no puede estar vacío';
            return null;
          },
          onFieldSubmitted: (_) => validateForm()
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context)
        ),
        FlatButton(
          child: Text(
            'Save',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          color: Colors.teal,
          onPressed: validateForm
        ),
      ],
    );
  }
}