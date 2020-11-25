class Movement {
  double quantity;
  String accountID;
  String accountName;
  DateTime date;

  Movement({this.quantity, this.accountID, this.accountName}) : date = DateTime.now();

  Map toMap() => {
    'quantity': quantity,
    'accountID': accountID,
    'date': date.toIso8601String(),
    'accountName': accountName,
  };

  Movement.fromMap(Map map) {
    quantity = map['quantity'];
    accountID = map['accountID'];
    date = DateTime.tryParse(map['date']);
    accountName = map['accountName'];
  }
}