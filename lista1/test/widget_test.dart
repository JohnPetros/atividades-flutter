import 'package:flutter_test/flutter_test.dart';

import 'package:lista1/main.dart';

void main() {
  testWidgets('renders main menu and navigates to module', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('EduCalc & Tasks'), findsOneWidget);
    expect(find.text('CALCULATORS'), findsOneWidget);
    expect(find.text('Temperature Converter'), findsOneWidget);

    await tester.tap(find.text('Temperature Converter').first);
    await tester.pumpAndSettle();

    expect(find.text('Temperature'), findsOneWidget);
    expect(find.text('Convert to Fahrenheit'), findsOneWidget);
  });
}
