
import 'package:get/get.dart';

import '../data/controllers/app_controller.dart';

class DependencyInjection {
  static void init() {    
    // controller
    Get.put<AppController>(AppController());
    
  }
}