
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/models/achievements/achievement_model.dart';

class AchievementsCard extends StatelessWidget {
  
  final Achievement  item;

  const AchievementsCard({
    Key? key,
    required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
        height: 80,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            Container(
              margin    : const EdgeInsets.only(right: 10),
              padding   : const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color       : Color.fromRGBO(0, 139, 191, 1),
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: SvgPicture.asset('assets/svg/star.svg', color: Colors.white, height: 30),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${item.title}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                Text('${item.description}', style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.black))
              ],
            )
          ],
        ),

    );
  }
}