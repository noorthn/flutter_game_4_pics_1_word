
import 'package:get/get.dart';

import '../routes/routes.dart';

import '../screens/splash/controllers/splash_binding.dart';
import '../screens/splash/splash_screen.dart';

import '../screens/home/controllers/home_binding.dart';
import '../screens/home/home_screen.dart';

import '../screens/classic/classic_screen.dart';
import '../screens/classic/controllers/classic_binding.dart';

class AppPages{
  static final List<GetPage> pages = [
    GetPage(
      name    : AppRoutes.splash, 
      page    : () => const SplashScreen(),
      binding : SplashBinding()
    ),
    GetPage(
      name    : AppRoutes.home, 
      page    : () => const  HomeScreen(),
      binding : HomeBinding()
    ),
    GetPage(
      name    : AppRoutes.classic, 
      page    : () => const  ClassicScreen(),
      binding : ClassicBinding()
    ),
  ];
}