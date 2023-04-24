import 'package:flutter/services.dart';
import 'package:gameagain/app/data/models/achievements/achievement_model.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import '../../../data/controllers/app_controller.dart';

class HomeController extends GetxController{
  
  @override
  void onReady()  async {
    super.onReady();
    await loadachievementList();
  }

  final GetStorage       storage            = GetStorage(); 
  final AppController    appController      = Get.find<AppController>();

  bool _isLoader                = false;
  bool  get isLoader            => _isLoader;
  set isLoader(data){_isLoader  = _isLoader ? false : true; update();}


  loadachievementList() async  {
    final String response         = await rootBundle.loadString('assets/json/achievements.json');
    appController.achievementList = achievementFromJson(response.toString());
    update();
  }

}