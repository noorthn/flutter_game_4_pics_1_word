

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoinCount extends StatelessWidget {
  final num coins;
  const CoinCount({
    Key? key,
    required this.coins
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: const EdgeInsets.only(top: 18, right: 15),
                  child: Stack(
                    children: [
                      Container(
                            width: 50,
                            height: 20,
                            margin: const EdgeInsets.only(left: 15, top: 1),
                            decoration:   const BoxDecoration(
                            color: Color.fromRGBO(212, 216, 225, 1),
                            borderRadius: BorderRadius.all( Radius.circular(5)),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(top: 3, left: 1, right: 1),
                            decoration:  const BoxDecoration(
                              color: Color.fromRGBO(222, 232, 251, 1),
                              borderRadius: BorderRadius.all( Radius.circular(5)),
                            ),
                            child: Center(child: Text('$coins', style: const TextStyle(color: Colors.black))),
                          ),
                      ),

                      InkWell(
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
                            child: SvgPicture.asset('assets/svg/ticket-star.svg', color: Colors.white, height: 18,)
                          ),
                            onTap: (){},
                      ),
                    ]
                  ),
                );
  }
}