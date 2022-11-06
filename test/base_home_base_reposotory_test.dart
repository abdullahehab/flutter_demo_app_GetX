import 'package:flutter_demo_app/core/utils/dependency.dart';
import 'package:flutter_demo_app/features/store/data/repository/home_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() async {
  DependencyCreator.init();
  TestWidgetsFlutterBinding.ensureInitialized();
  var repository = Get.find<HomeRepository>();

  group('Test Home Screen', () {
    test('Test get address', () async {
      var result = await repository.getAddresses();
      expect(result.isRight(), true);
    });

    test('Test get categories', () async {
      var result = await repository.getCategories();
      expect(result.isRight(), true);
    });

    test('Test get getDealOfTheDay', () async {
      var result = await repository.getDealOfTheDay();
      expect(result.isRight(), true);
    });

    test('Test get banner', () async {
      var result = await repository.getBanner();
      expect(result.isRight(), true);
    });
  });
}
