import 'package:flutter/material.dart';
import 'package:mymoney/controllers/movements_controller.dart';
import 'package:mymoney/custom/textfield.dart';
import 'package:mymoney/models/account.dart';
import 'package:mymoney/models/movement.dart';

AlertDialog addMovementDialog(
  context,
  List<Account> accounts,
  Function() onFinish
) {

  final _contentKey = GlobalKey<_DialogContentState>(); 

  void validateForm() async {
    if(_contentKey.currentState.validate()) {
      final controller = MovementsController.getInstance();
      await controller.saveMovement(Movement(
        quantity: _contentKey.currentState.quantity,
        accountID: _contentKey.currentState.account.id,
        accountName: _contentKey.currentState.account.name,
      ));
      if(onFinish != null)
        await onFinish();
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
          'Add Movement',
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
    content: _DialogContent(
      key: _contentKey,
      accounts: accounts
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

class _DialogContent extends StatefulWidget {

  final List<Account> accounts;

  _DialogContent({
    @required Key key,
    @required this.accounts
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DialogContentState(accounts.first);
}

class _DialogContentState extends State<_DialogContent> {
  final _formKey = GlobalKey<FormState>();

  String _quantity;
  Account _account;

  _DialogContentState(firstAccount) : _account = firstAccount;

  Account get account => _account;
  double get quantity => double.tryParse(_quantity);

  bool validate() => _formKey.currentState.validate();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          CustomTextField(
            hint: 'Quantity',
            fillColor: Colors.grey[900],
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.number,
            validator: (String value) {
              _quantity = value;
              if (value == null || value.isEmpty)
                return 'Este campo no puede estar vacío';
              return null;
            },
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Account:',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
          SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(32)
            ),
            child: ListView.builder(
              itemCount: widget.accounts.length,
              itemBuilder: (_, index) => Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    setState(() => _account = widget.accounts.elementAt(index));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          widget.accounts.elementAt(index).id == _account?.id
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 8),
                        Text(
                          widget.accounts.elementAt(index).name,
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}