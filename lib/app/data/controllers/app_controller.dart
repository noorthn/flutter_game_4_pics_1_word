import 'package:gameagain/app/data/models/achievements/achievement_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController{
 
  final GetStorage       storage            = GetStorage(); 
  
  @override
  void onInit() {
    super.onInit();
    // ignore: avoid_print
    print(" 🌟 Iniciando GameAgain  🌟 ");
    loadCoins();
    loadLevel();
  }


  bool _isLogin                             =  false;
  bool get isLogin                          => _isLogin;
  set  isLogin(data){_isLogin               =  data; update();}

  /// [achievementList] availables for unlock
  List<Achievement>  _achievementList       = [];
  List<Achievement>  get achievementList    => _achievementList;
  set achievementList(data){_achievementList=  data; update(); }
  
  /// [exp]  earned
  int _exp                                  =  0;
  int get exp                               => _exp;
  set exp(data){ _exp                       =  data; storage.write('exp', _exp); update();}
  loadExp(){_exp                            =  storage.read('exp') ?? 0; update();}

  ///   current [elo] of the player, obtained from the sum of his exp obtained in the game
  int _elo                                  =  0;
  int get elo                               => _elo;
  set elo(data){ _exp                       =  data; storage.write('elo', _elo); update();}
  loadElo(){_elo                            =  storage.read('elo') ?? 0; update();}

  /// Monedas actuales del jugador
  int _coins                                =  0;
  int get coins                             => _coins;
  set coins(data){ _coins                   =  data; storage.write('coins', _coins); update();}
  loadCoins(){_coins                        =  storage.read('coins') ?? 0; update();}
  
  /// Nivel Actual del jugador
  int _level                                =  0;
  int get level                             => _level;
  set level(data){_level                    =  data; storage.write('level', _level); update();}
  loadLevel(){_level                        =  storage.read('level') ?? 0; update();}

  /// Nivel Actual del jugador en [TimeTrial]
  int _levelTimeTrial                       =  0;
  int get levelTimeTrial                    => _levelTimeTrial;
  set levelTimeTrial(data){_levelTimeTrial  =  data; storage.write('levelTimeTrial', _levelTimeTrial); update();}
  loadlevelTimeTrial(){_levelTimeTrial      =  storage.read('levelTimeTrial') ?? 0; update();}

  /// Continuous games without errors
  int _withoutError                         =  0;
  int get withoutError                      => _withoutError;
  set withoutError(data){ _withoutError     =  data; storage.write('withoutError', _withoutError); update();}
  loadWithoutError(){_withoutError          =  storage.read('withoutError') ?? 0; update();}

  /// Continuous games faster response
  Faster _faster                            =  Faster();
  Faster get faster                         => _faster;
  set faster(data){ _faster                 =  data; storage.write('faster', _faster); update();}
  loadFaster(){_faster                      =  storage.read('faster') ?? Faster(); update();}


  ///Find if you have an achievement available
  findAchievement(){

  }
  
}