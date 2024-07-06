import 'package:get/get.dart';

class StudyController extends GetxController {
  //TODO: Implement StudyController

  final count = 0.obs;

  var title = 'Study Abroad'.obs;
  var isExpanded = false.obs;
  var isCollapsed = false.obs;
  var isTitle = false.obs;

  void changeExpanded(bool value) {
    isExpanded.value = value;
  }

  void changeCollapsed(bool value) {
    isCollapsed.value = value;
  }

  void changeTitle(bool value) {
    isTitle.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    isTitle.value = true;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
