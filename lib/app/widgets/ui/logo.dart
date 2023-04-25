
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Image(image: AssetImage('assets/images/logo.png'), height: 200,)
      ),
    );
  }
}