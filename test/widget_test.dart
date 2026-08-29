import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/nav_controller.dart';
import 'package:portfolio/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.testMode = true;
    if (!Get.isRegistered<NavController>()) {
      Get.put(NavController(), permanent: true);
    }
  });

  testWidgets('app launches into splash', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    expect(find.byType(MyApp), findsOneWidget);
  });
}
