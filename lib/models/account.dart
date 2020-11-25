import 'package:uuid/uuid.dart';

class Account {
  String id;
  String name;

  Account({this.name}) : id = Uuid().v1();

  Map toMap() => {
    'id': id,
    'name': name
  };

  Account.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
  }
}