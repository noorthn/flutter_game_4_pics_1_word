import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/splash_controller.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_)=> Scaffold(
        body:  SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Container(
                      //   margin: const EdgeInsets.symmetric(vertical: 30),
                      //   child: const Image(image: AssetImage('assets/images/vtr-logo.png'), width: 175)
                      // ),
                      CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                      Container(height: 60),
                      Text('2021 © Loyi - Game Again', style: Theme.of(context).textTheme.bodyText1),
                    ]
                  )
                )
              );
            }
          ),
        )
      ),
    );
  }
}