import 'package:flutter_test/flutter_test.dart';

import 'package:lista2/main.dart';

void main() {
  testWidgets('Renderiza menu e navega para Lista de Compras', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FlutterLabApp());

    expect(find.text('Flutter Lab'), findsOneWidget);
    expect(find.text('Exercícios Práticos'), findsOneWidget);
    expect(find.text('Lista de Compras'), findsOneWidget);

    await tester.tap(find.text('Lista de Compras'));
    await tester.pumpAndSettle();

    expect(find.text('Organize seus mantimentos'), findsOneWidget);
    expect(find.text('Adicionar novo item'), findsOneWidget);
    expect(find.text('Novo Item'), findsOneWidget);
    expect(find.text('Lista de Compras'), findsWidgets);
  });
}
