class Account {
  String name;

  Account({this.name});

  Map toMap() => {
    'name': name
  };

  Account.fromMap(Map map) {
    name = map['name'];
  }
}