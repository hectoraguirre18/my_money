import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mymoney/screens/home_screen.dart';

void main() {
  testWidgets('Given a home screen where there is a button then it has an add icon', (WidgetTester tester) async {
    // Assemble
    await tester.pumpWidget(
      ProviderScope( 
        child: MaterialApp(
          home: HomeScreen(),
        )
      )
    );

    // Act
    
    // Assert

      expect(find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
  });
}
