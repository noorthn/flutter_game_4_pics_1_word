import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gameagain/app/data/models/achievements/achievement_model.dart';
import 'package:get/get.dart';

import '../../widgets/card/achievements/achievements_card.dart';
import '../../widgets/card/coins/coint_count.dart';
import '../../widgets/card/coins/level_count.dart';
import 'controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(214, 232, 238, 1),
          borderRadius: BorderRadius.circular(11.0),
          image: const DecorationImage(opacity: .5,image: AssetImage("assets/images/letter_bg-01.png"),fit: BoxFit.cover),
        ),
      child: Scaffold(
        backgroundColor : Colors.transparent,
        appBar          : AppBar(
          backgroundColor : Colors.transparent,
          elevation       : 0,
          actions         :  [CoinCount(coins: controller.appController.coins)],
          leadingWidth    : 200,
          leading         : Container(
            margin: const EdgeInsets.only(left: 20), 
            child:  LevelCount(level: controller.appController.level)
          ),
        ),
        body            : ListView(
          children: [

            SizedBox(height: Get.height / 6),
            Center(
              child: InkWell(
                onTap: (){Get.toNamed('/classic');},
                child: Container(
                  height    : 60,
                  width     : 200,
                  padding   : const EdgeInsets.symmetric(horizontal: 30, vertical: 9),
                  decoration: const BoxDecoration(
                    color       : Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image       :  DecorationImage(opacity: .5,image: AssetImage("assets/images/letter_bg-01.png"),fit: BoxFit.cover),
                  ),
                  child     : const Center(child: Text('PLAY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Color.fromRGBO(0, 21, 71, 1)),))
                )
              )
            ),
            
            const SizedBox(height: 50),
            Container(
              margin  : const EdgeInsets.symmetric(horizontal: 20),
              child   : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children          : const [
                  Text('Achievement', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Text('0 / 20')
                ]
              )
            ),
            
            for(var item in controller.appController.achievementList)
              AchievementsCard(item: item)

          ]
        )
    
      )
    );
  }
}

class AHomeScreen extends StatefulWidget {
  const AHomeScreen({ Key? key }) : super(key: key);

  @override
  State<AHomeScreen> createState() => _AHomeScreenState();
}

class _AHomeScreenState extends State<AHomeScreen> {
  
  header(context, _){
    return Container(
      margin: const EdgeInsets.only(top: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text('BIENVENIDO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text('Selecciona un modo de juego', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.grey))
          ),
          Container(height: 20),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                gameCard(level: 11),
                gameCard(name: 'CONTRA RELOJ', level: 28, available: false, game: 1, color: const Color.fromRGBO(253, 188, 0, 1), player: 'player-01' ),
                gameCard(name: 'MULTI- PLAYER', level: 80, available: false, game: 1, color: const Color.fromRGBO(112, 51, 255, 1), ),
                Container(width: 15)
              ],
            ),
          ),
          newsCard()
        ],
      ),
    );
  }

  gameCard({name = 'CLASICO', level = 0, game = 0, available=  true, color = const Color.fromRGBO(78, 124, 255, 1), player= 'player-0'  }){
    return InkWell(
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(left: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(11.0),
          image: const DecorationImage(opacity: .5,image: AssetImage("assets/images/letter_bg-01.png"),fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/medal-star.svg', color: Colors.white, height: 20),
                  Container(margin: const EdgeInsets.only(left: 5), child:  Text(level.toString(),  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)))
                ]
              )
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child:  Image(image: AssetImage('assets/images/$player.png'), width: 50)
                  ),
                  Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
                ],
              ),
            ),
            Text(available ? 'Disponible': 'Próximamente', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 12))
          ]
        )
      ),
      onTap: (){
        Get.toNamed('/classic');
      },
    );
  }

  newsCard(){
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: Get.size.height / 9.5,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(25, 51, 100, 1),
          borderRadius: BorderRadius.circular(15.0),
          image: const DecorationImage(opacity: .5,image: AssetImage("assets/images/letter_bg-01.png"),fit: BoxFit.cover),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset('assets/svg/shop.svg', color: Colors.white, height: 50),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('TIENDA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                Text('Ofertas disponibles', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.white))
              ],
            )
          ],
        ),

    );
  }

  achievementsCard(Achievement  item){
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
        height: Get.size.height / 9.5,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset('assets/svg/star.svg', color: Colors.black, height: 50),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${item.title}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                Text('${item.description}', style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.black))
              ],
            )
          ],
        ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_)=> Scaffold(
        backgroundColor: const Color.fromRGBO(95, 63, 248, 1),
        body:  CustomScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Get.theme.scaffoldBackgroundColor,
              automaticallyImplyLeading: false,
              //title: const Text('WELCOME', style: TextStyle(color: Colors.black,fontSize: 25, fontWeight: FontWeight.bold)),
              expandedHeight: Get.height / 1.5,
              leading: 
                InkWell(
                  child: Container(margin: const EdgeInsets.symmetric(horizontal: 15),child: SvgPicture.asset( 'assets/svg/setting-2.svg', color: Colors.black)),
                  onTap: () => Get.toNamed('/notifications'),
                ),
              actions: [
                Container(
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
                            child: Center(child: Text('${_.appController.coins}', style: const TextStyle(color: Colors.black))),
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
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: header(context, _)
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [ 
                  Container(
                    margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: const Text('Logros', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.white))
                  ),
                  Row(
                    children: [
                      Text('Achievement'),
                      Text('0 / 20')
                    ],
                  ),
                  for(var item in _.appController.achievementList)
                  achievementsCard(item),
                ],
              ),
            )
          ]
        )
      )
    );
  }
}