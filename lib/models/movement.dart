class Movement {
  double quantity;
  String accountID;
  DateTime date;

  Movement({this.quantity, this.accountID, this.date});

  Map toMap() => {
    'quantity': quantity,
    'accountID': accountID,
    'date': date.toIso8601String(),
  };

  Movement.fromMap(Map map) {
    quantity = map['quantity'];
    accountID = map['accountID'];
    date = DateTime.tryParse(map['date']);
  }
}