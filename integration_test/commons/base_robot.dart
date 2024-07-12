import 'package:flutter_test/flutter_test.dart';
import 'package:teste_pilar/main.dart' as app;

abstract class BaseRobot {
  final WidgetTester tester;

  BaseRobot({required this.tester});

  Future<void> startApp() async {
    await app.main();
    await tester.pumpAndSettle();
  }

  Future<void> pop() async {
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
  }
}
