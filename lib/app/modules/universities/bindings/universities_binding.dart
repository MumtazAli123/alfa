import 'package:get/get.dart';

import '../controllers/universities_controller.dart';

class UniversitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UniversitiesController>(
      () => UniversitiesController(),
    );
  }
}
