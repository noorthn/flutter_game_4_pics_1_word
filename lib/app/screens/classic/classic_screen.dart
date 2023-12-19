import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gameagain/app/data/models/word_model.dart';
import 'package:gameagain/app/widgets/animations/particles/particle_model.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'controllers/classic_controller.dart';

class ClassicScreen extends StatefulWidget {
  const ClassicScreen({ Key? key }) : super(key: key);

  @override
  State<ClassicScreen> createState() => _ClassicScreenState();
}

class _ClassicScreenState extends State<ClassicScreen> {
  GlobalKey key  = GlobalKey(); 
  GlobalKey key1 = GlobalKey(); 
  GlobalKey key2 = GlobalKey(); 
  GlobalKey key3 = GlobalKey(); 
  GlobalKey key4 = GlobalKey(); 
  GlobalKey key5 = GlobalKey();
  GlobalKey key6 = GlobalKey();

  
  imagesContent(Word  word){
    return Container(
      height: Get.size.height / 1.9,
      margin: const EdgeInsets.all(15),
      child: GridView.count(
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: <Widget>[
          if(word.pictures!.isNotEmpty)
          for (int i = 0; i < 4; i++)
            imageToShow(word.pictures![i])
        ],
      ),
    );
  }

  imageToShow(Picture image){
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.0),
        color: const Color.fromRGBO(212, 216, 225, 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          height: double.infinity,
          width: double.infinity,
          imageUrl:  image.url!,
          fit: BoxFit.cover,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor:const Color.fromRGBO(228,228,228,1),
            highlightColor:Colors.grey[100]!,
            child:Container(color:Colors.white),
          )
        ),
      ),
    );
  }

  lettersSelected(ClassicController _){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < _.word.letters!.length; i++)
            letterSelected(_, i)
        ],
      ),
    );
  }

  letterSelected(ClassicController _,  int id){
    var letter = '';
    if(_.lettersSelected.isNotEmpty){letter = _.isSelectedToShow(id);}
    return letter == '' ? emptyLetterContainer() : InkWell(
      highlightColor: Colors.transparent,
      splashColor:  Colors.transparent,
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration:    BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all( Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: _.isComplete 
              ? _.wordStatus  
                ? const Color.fromRGBO(78, 193, 129, .5) 
                : const Color.fromRGBO(246, 81, 100, .5) 
              : const Color.fromRGBO(78, 124, 255, .2),
              spreadRadius: 3,
              blurRadius: 4,
              offset: const Offset(0, 0), 
            )
          ]
        ),
        child: Center(child: Text(letter, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25))) ,
      ),
      onTap: () => _.removeLetter(id),
    );
  }

  lettersAvailable(context, ClassicController _){
    return  Container(
      height: 105,
      margin: const EdgeInsets.all(15),
      child: GridView.builder(
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, childAspectRatio: 5.7/5.5,),
         itemCount   :  14 ,
        itemBuilder: (BuildContext context, int i) { 
          if(i == 6){
            return buyLetter(_);
          }else if(i == 13){
            return payForClean(_);
          }else if(i > 6){
            return letterAvailable(context, _, _.lettersOptions[i -1], i - 1);
          }else{
            return letterAvailable(context, _, _.lettersOptions[i], i);
          }
        },
      ),
    );
  }

  letterAvailable(context, ClassicController _, String letter, int id){
    var x = _.isSelected(id);
      if(x){
        return emptyLetterContainer( from: true);
      } else if(_.lettersOptions[id] == ''){
        return emptyLetterContainer( from: true);
      }else{  
      return  InkWell(
      highlightColor: Colors.transparent,
      splashColor:  Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
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
        margin: const EdgeInsets.all(5),
        child: x ? Container() : Center(child: Text(letter, style: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold))),
      ),
      onTap: () async {
        if(!x){
          await _.onSelectLetter(letter, id);
        }
        
      },
    );}
  }

  emptyLetterContainer({from = false}){
    return Container(
      width: 40,
      height: 40,
      margin: from  ? const EdgeInsets.all(5) : const EdgeInsets.symmetric(horizontal: 5),
      decoration:   const BoxDecoration(
        color: Color.fromRGBO(212, 216, 225, 1),
        borderRadius: BorderRadius.all( Radius.circular(5)),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 3, left: 1, right: 1),
        decoration:  const BoxDecoration(
          color: Color.fromRGBO(222, 232, 251, 1),
          borderRadius: BorderRadius.all( Radius.circular(5)),
        )
      ),
    );
  }

  buyLetter(ClassicController _){
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
        color:  Color.fromRGBO(78, 124, 255, 1),
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
        child: Center(
          child: SvgPicture.asset('assets/svg/lamp-on.svg', color: Colors.white),
        ),
      ),
      onTap: (){
        _.buyOneLetter('a', 2);
      }
    );
  }

  payForClean(ClassicController _){
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
        color:  Color.fromRGBO(246, 81, 100, 1),
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
        child: Center(
          child: SvgPicture.asset('assets/svg/lifebuoy.svg', color: Colors.white),
        )
      ),
      onTap: ()=> _.payForCleanOptions(),
    );
  }

  customDialogBox (context, _){
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context, _),
    );
  }

  header(ClassicController _){
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: SvgPicture.asset('assets/svg/arrow-left.svg', color: Colors.black),
            onTap: ()=> Get.back(),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25),
            child: Stack(
              children: [
                Container(
                  width: 50,
                  margin: const EdgeInsets.only(left: 15, top: 1),
                  decoration:   const BoxDecoration(
                    color: Color.fromRGBO(212, 216, 225, 1),
                    borderRadius: BorderRadius.all( Radius.circular(5))
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(top: 3, left: 1, right: 1),
                    decoration:  const BoxDecoration(
                      color: Color.fromRGBO(222, 232, 251, 1),
                      borderRadius: BorderRadius.all( Radius.circular(5))
                    ),
                    child: Center(child: Text('${_.appController.level}')),
                  )
                ),

                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
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
                  child: SvgPicture.asset('assets/svg/medal-star.svg', color: Colors.black, height: 18,)
                ),
              ],
            ),
          ),
          counters(_)
        ]
      )
    );
  } 

  counters(_, {k}){
    return Stack(
      children: [
        Container(
             width: 50,
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
            child: Center(child: Text('${_.appController.coins}')),
          ),
        ),
        InkWell(
          child: Container(
            key: k,
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
    );
  }

  askForHelp(_){
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
        color:  Color.fromRGBO(112, 51, 255, 1),
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
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('PEDIR AYUDA A UN AMIGO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            Container(width: 20),
            SvgPicture.asset('assets/svg/whatsapp.svg', color: Colors.white, height: 20),
          ],
        ),
      ),
      onTap: (){
        _.createAvailableLetters();
      },
    );
  }
 
  onLevelComplete(ClassicController _){
    return Container(
      width: Get.size.width,
      height: Get.size.height,
      color: Colors.black.withOpacity(.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(top: 15, right: 15),
            child: counters(_, k: key),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: contentBox(context, _ ),
          ),
          Container()
        ],
      ),
    );
  }

  contentBox(context,ClassicController  _ ){
    return Container(
      height        : 260,
      padding       : const EdgeInsets.all(20),
      margin        : const  EdgeInsets.only(top: 20, left: 15, right: 15),
      decoration    : BoxDecoration(
        shape       : BoxShape.rectangle,
        color       : Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(key   : key2,),
                  Container(width : 30),
                  Container(key   : key5,),
                  Container(width : 30),
                  Container(key   : key6,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    key: key3,
                    margin: const EdgeInsets.only(right: 20),
                  ),
                  Text('¡GENIAL!', style:  Get.textTheme.headline3),
                  Container(
                    key: key4,
                    margin: const EdgeInsets.only(left: 20),
                  ),
                ]
              ),
            ]
          ),
          const SizedBox(height: 20),
          lettersSelected( _),
          SizedBox(
            key: key1,
            width: 80,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                const Text(' +5', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),),
              ]
            )
          ),
          Container(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Container(
                  width         : 120,
                  padding       : const EdgeInsets.all(15),
                  decoration    :  const BoxDecoration(
                    color       : Color.fromRGBO(78, 193, 129, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child:  const Center(child: Text('CONTINUAR', style:  TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold))),
                ),
                onTap: () async  { 
                  if(!_.ischecking){
                    _.ischecking = true;
                    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
                    Offset position = box.localToGlobal(Offset.zero); //this is global position
                    double y = position.dy; 
                    double x = position.dx; 

                    RenderBox box1 = key1.currentContext?.findRenderObject() as RenderBox;
                    Offset position1 = box1.localToGlobal(Offset.zero); //this is global position
                    double y1  = position1.dy; 
                    double x1  = position1.dx;  
                      
                    RenderBox box2 = key2.currentContext?.findRenderObject() as RenderBox;
                    Offset position2 = box2.localToGlobal(Offset.zero); //this is global position
                    double y2  = position2.dy; 
                    double x2  = position2.dx;  
                    
                    RenderBox box3 = key3.currentContext?.findRenderObject() as RenderBox;
                    Offset position3 = box3.localToGlobal(Offset.zero); //this is global position
                    double y3  = position3.dy; 
                    double x3  = position3.dx;  
                    
                    RenderBox box4 = key4.currentContext?.findRenderObject() as RenderBox;
                    Offset position4 = box4.localToGlobal(Offset.zero); //this is global position
                    double y4  = position4.dy; 
                    double x4  = position4.dx;  
                    
                    RenderBox box5 = key5.currentContext?.findRenderObject() as RenderBox;
                    Offset position5 = box5.localToGlobal(Offset.zero); //this is global position
                    double y5  = position5.dy; 
                    double x5  = position5.dx;  
                    
                    RenderBox box6 = key6.currentContext?.findRenderObject() as RenderBox;
                    Offset position6 = box6.localToGlobal(Offset.zero); //this is global position
                    double y6  = position6.dy; 
                    double x6  = position6.dx;  

                    await _.getWidgetPositions(x, y, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6,);
                    Timer(const Duration(seconds: 1), () =>   _.rewardActive = true);
                    Timer(const Duration(seconds: 1), () =>   _.putNextWord());
                  }
                }
              ),
              
              InkWell(
                child: Container(
                  width: 110,
                  padding: const EdgeInsets.all(15),
                  decoration    :  BoxDecoration(
                    color: Get.theme.primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child:  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: SvgPicture.asset('assets/svg/ticket-star.svg', color: Colors.white, height: 18)
                      ),
                      const Text('AD X 2', style:  TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                onTap: (){_.putAdsByCompleteWord();},
              )
            ]
          )
        ]
      )
    );
  }

  createRewards(ClassicController _){
    if(_.rewardActive){
      for(  var i = 0;  i < 9 ; ){
         return RewardToBag(classicController: _, position: _.positionB);
      }
    }else{
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassicController>(
      builder: (_)=> Scaffold(
        body:  Stack(
          children: [
            SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.1,
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints viewportConstraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            header(_),
                            imagesContent(_.word),
                            lettersSelected(_),
                            if(_.word.letters!.isNotEmpty)
                            lettersAvailable(context, _),
                            askForHelp(_)
                          ]
                        )
                      )
                    );
                  }
                ),
              ),
            ),
            if(_.wordStatus)
              onLevelComplete(_),
            if(_.rewardActive)
              for(  var i = 0;  i < 9 ; i++)
              RewardToBag(classicController: _, position: _.positionB)
      
          ],
        )
      ),
    );
  }
}