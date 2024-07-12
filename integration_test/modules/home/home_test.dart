import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../robots/home_robot.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Navigation int the app', () {
    testWidgets(
      '''Since I access the app
      When I search for a product media
      Then I should see the product in the list''',
      (WidgetTester tester) async {
        final homeRobot = HomeRobot(tester: tester);

        await homeRobot.startApp();
        await homeRobot.inputSeachText(text: 'bad boys');
        await homeRobot.tapSearch();
        await homeRobot.tapSearchCard();
        await homeRobot.pop();
        await homeRobot.cleanSearch();
        await homeRobot.tapInfoCard();
      },
    );
  });
}
