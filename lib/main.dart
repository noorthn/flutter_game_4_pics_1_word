import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/pages.dart';
import 'app/screens/splash/controllers/splash_binding.dart';
import 'app/screens/splash/splash_screen.dart';
import 'app/theme/theme.dart';
import 'app/utils/dependencies.dart';

  void main() async{
    WidgetsFlutterBinding.ensureInitialized(); 
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    await GetStorage.init();
    DependencyInjection.init();
    runApp(const MyApp());
  }


  class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home                      : const SplashScreen(),
        initialBinding            : SplashBinding(),
        getPages                  : AppPages.pages,
        theme                     : lightTheme(), 
      );
    }
  }
