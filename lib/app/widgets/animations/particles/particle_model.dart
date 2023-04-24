import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gameagain/app/screens/classic/controllers/classic_controller.dart';


class RewardToBag extends StatefulWidget {

  final ClassicController? classicController;
  final List<double>? position;
  const RewardToBag({ 
    Key? key, 
    this.classicController, 
    this.position 
  }): super(key: key);

  @override
  State<RewardToBag> createState() => _RewardToBagState();
}

class _RewardToBagState extends State<RewardToBag> {

    var i = 0;
    // ignore: prefer_typing_uninitialized_variables
    var a;
    // ignore: prefer_typing_uninitialized_variables
    var b;
    // ignore: prefer_typing_uninitialized_variables
    var c;


  @override
  Widget build(BuildContext context) {
    if( i == 0){
      Timer(const Duration(milliseconds: 100), () =>  setState(() {i = 1;}));
    }
    a = widget.classicController!.positionB;
    b = widget.classicController!.setRewardPosition();
    c = widget.classicController!.positionA;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            width: 20.0,
            height: 20.0,
            top : i == 0  
                    ? a![1] 
                    : i == 1 
                        ? b![1] 
                        : c![1] ,

            left: i == 0  
                    ? a![0] 
                    : i == 1 
                        ? b![0] 
                        : c![0],
            duration: const Duration(milliseconds: 350),
            curve: i != 1 ? Curves.linear :  Curves.fastOutSlowIn,
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color:Color.fromRGBO(254, 181, 18, 1),
                  borderRadius: BorderRadius.all( Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(78, 124, 255, .2),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(0, 0), 
                    )
                  ]
                ),
                child: SvgPicture.asset('assets/svg/ticket-star.svg', color: Colors.white, height: 18)
              ),
              onTap: () {},
            ),
            onEnd: ()  {
              setState(() {
                if(i == 1){
                  i = 2;
                }else{
                  widget.classicController!.rewardActive = false;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
