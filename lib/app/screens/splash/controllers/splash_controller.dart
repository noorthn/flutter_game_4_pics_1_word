import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/controllers/app_controller.dart';

class SplashController extends GetxController{
  
  final GetStorage       storage            = GetStorage(); 
  final AppController    appController      = Get.find<AppController>(); 

  
  @override
  void onReady(){
    super.onReady();
    init();
  }

 
  init() async { 
    Timer(const Duration(seconds: 3), () => Get.toNamed('/home'));
  }
  
  
}