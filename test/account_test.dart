import 'package:flutter_test/flutter_test.dart';
import 'package:mymoney/models/account.dart';

void main() {
  
  test('Given an account with name = Efectivo', () async {
    // Arrange
    final map = {
      "id":"1",
      "name": "Efectivo"
    };

    // Act
    final account = Account.fromMap(map);
    
    // Assert
    expect(account.name,"Efectivo");
  });
}