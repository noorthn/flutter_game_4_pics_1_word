
import 'package:get/get.dart';
import 'classic_controller.dart';

class ClassicBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ClassicController());
  }
}