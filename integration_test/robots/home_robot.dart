import 'package:flutter_test/flutter_test.dart';
import 'package:teste_pilar/app/commons/presentation/keys/keys.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

import '../commons/base_robot.dart';

class HomeRobot extends BaseRobot {
  HomeRobot({required super.tester});

  Future<void> inputSeachText({required String text}) async {
    final input = find.byKey(AppKeys.home.searchBarKey.toKey());

    expect(input, findsOneWidget);
    await tester.enterText(input, text);

    await tester.pumpAndSettle();
  }

  Future<void> tapSearch() async {
    final buttonSearchFinder = find.byKey(AppKeys.home.buttonSearchKey.toKey());

    await tester.ensureVisible(buttonSearchFinder);
    await tester.tap(buttonSearchFinder);

    await tester.pumpAndSettle();
  }

  Future<void> tapSearchCard() async {
    final cardSearchFinder = find.byType(CardSearch);

    if (cardSearchFinder.evaluate().isNotEmpty) {
      await tester.ensureVisible(cardSearchFinder.first);
      await tester.tap(cardSearchFinder.first);

      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
    }
  }

  Future<void> cleanSearch() async {
    final cleanFinder = find.text("Limpar");

    await tester.ensureVisible(cleanFinder);
    await tester.tap(cleanFinder);
    await Future.delayed(const Duration(seconds: 1));
    await tester.pumpAndSettle();
  }

  Future<void> tapInfoCard() async {
    final cardInfoFinder = find.byType(CardInfo);

    if (cardInfoFinder.evaluate().isNotEmpty) {
      await tester.ensureVisible(cardInfoFinder.first);
      await tester.tap(cardInfoFinder.first);

      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
    }
  }
}
