import 'package:flutter/services.dart';
import 'package:gameagain/app/data/models/word_model.dart';
import 'package:gameagain/app/utils/constants.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import '../../../data/controllers/app_controller.dart';

class ClassicController extends GetxController{
  
  
  @override
  void onReady()  async {
    super.onReady();
    await loadWordList();
  }

  final GetStorage       storage            = GetStorage(); 
  final AppController    appController      = Get.find<AppController>();

  bool _isLoader                    = false;
  bool  get isLoader                => _isLoader;
  set isLoader(data){_isLoader      = _isLoader ? false : true; update();}

  bool _isComplete                  = false;
  bool  get isComplete              => _isComplete;

  bool _wordStatus                  = false;
  bool  get wordStatus              => _wordStatus;
  
  bool _ischecking                  = false;
  bool  get ischecking              => _ischecking;
  set ischecking(data){_ischecking  = data; update();}

  List<Word> _wordList              = [];
  List<Word>  get wordList          => _wordList;
  
  Word _word                        = Word(letters: [], pictures: []);
  Word get word                     => _word;
  set word(data){_word              = data; update();}


  List<String> _lettersOptions      =   [];
  List<String> get lettersOptions   =>  _lettersOptions;

  List<int> _lettersSelected        = [];
  List<int> get lettersSelected     =>_lettersSelected;
 
 ///the [-1] is used to identify letters that were removed from the [lettersSelected] 
 ///and that can be replaced by letters correctly  

  /// Carga Palabras Almacenadas en el json
  loadWordList() async  {
    final String response       = await rootBundle.loadString('assets/json/words_data.json');
    _wordList                   = wordFromJson(response.toString());
    _word                       = _wordList[appController.level];
    _lettersSelected            = [];
    createAvailableLetters();
    update();
  } 

  /// Cuando seleccionas una [Letra]
  onSelectLetter(String letter, int id) async {
    var _isReplaceable = lettersSelected.contains(-1);
    if(lettersSelected.length != _word.letters!.length || _isReplaceable){
      if(_isReplaceable){
        var z = lettersSelected.indexWhere((element) => element == -1);
        lettersSelected[z] = id;
      }else{
        if(lettersSelected.length < _word.letters!.length ){
          lettersSelected.add(id);
        }
      }
      var a = lettersSelected.contains(-1);
      if(lettersSelected.length == _word.letters!.length && !a){
        await checkWord();
      }else{
        _isComplete = false;
      }
    }
    update();
  }

  /// Chequea si una [Letra] ya esta seleccionada para no mostrarla
  isSelected(int id){
    bool  x = false;
    var a = lettersSelected.firstWhere((element) => element == id, orElse: () => -1 );
    if(a !=  -1){x = true;}
    return x;
  }

  ///  Regresa la letra seleccionada
  isSelectedToShow(int id){
    var b = '';
    if(id < lettersSelected.length){
      var a = lettersSelected[id];
      if(a != -1){
        b =_lettersOptions[a];
      }
    }
    return b;
  }

  /// Remueve una [Word] seleccionada
  removeLetter(int id){
    if(id != -1){
      lettersSelected[id] = -1;
      _isComplete = false;
    }
    update();
  }

  /// Chequea si la [Word] es correcta
  checkWord(){ 
    _isComplete         = true;
    var a = [];
    /// Build the Word
    for(var i in lettersSelected){a.add(_lettersOptions[i]);}
    /// check the word is correct
    if(a.toString() == word.letters.toString()){
      _wordStatus       = true;
    }else{
      _wordStatus       = false;
    }
    update();
  }

  ///Reset and update for the next word
  putNextWord({coins = 10}){
    appController.level =   appController.level + 1;
    word                =   _wordList[appController.level];
    _lettersSelected    =   [];
    _wordStatus         =   false;
    _isComplete         =   false;
    appController.coins =   appController.coins + coins ;
    createAvailableLetters();
    ischecking = false;
    update();
  }

  /// this function will display an ad by user selection when completing the word correctly
  /// and will [double] your [Coins]
  putAdsByCompleteWord(){
    putNextWord(coins: 20);
    update();
  }

  ///Buy a [letter] if you have [Six]-[tickets] or more
  /// the function will find a first empty space and search for the assigned letter
  buyOneLetter(String letter, int id) async {

    if(appController.coins >= 6){
      var a = _word.letters;
      var b = [];
      for(var i in lettersSelected){ if(i != -1){b.add(_lettersOptions[i]);}}

      bool _replaced = false;
      for(var i = 0; i < _word.letters!.length; i++){
        if(!_replaced){
          if(lettersSelected.isEmpty){
            var e = lettersOptions.indexWhere((element) => element == a![i]);
            lettersSelected.add(e);
            _replaced = true;
          }else{
            if(lettersSelected.length < a!.length){
              var f = lettersSelected.length;
              var c = lettersOptions.indexWhere((element) => element == a[f ]);
              lettersSelected.add(c);
              _replaced = true;
            }else if(lettersSelected[i] == -1){
              var c = lettersOptions.indexWhere((element) => element == a[i]);
              lettersSelected[i] = c;
              _replaced = true;
            }
          }
        }
      }
      
      var z = lettersSelected.contains(-1);
      if(lettersSelected.length == _word.letters!.length && !z){
          await checkWord();
      }else{
        _isComplete = false;
      }
      appController.coins =   appController.coins - 6 ;
    }
    update();
  }
  
  /// Clear [lettersOptions] and only show the real [letters] 
  payForCleanOptions() async {
    if(appController.coins >= 15){
      _lettersSelected = [];
      List<String> a = _word.letters!;
      var  _x =  [];
      var  _b =  lettersOptions;
      List<int> _c    =  [];
      for(var i = 0; i < lettersOptions.length; i++){
          _x.add(_b[i]);
      }
      for(var i = 0; i < a.length; i++){
        var d = a[i];
        var e = _x.indexWhere((element) => element == d);
        var f = _c.contains(e);
        if(f){
          _x[e] = '+';
          var g = _x.indexWhere((element) => element == d);
          _c.add(g);
        }else{
          _c.add(e);
        }
      }
      for(var i = 0; i < lettersOptions.length; i++){
        var f = _c.contains(i);
        if(!f){
          lettersOptions[i] = ''; 
        }
      }
      appController.coins = appController.coins - 15;
    }
    update();
  }

  /// generates random letter options
  createAvailableLetters(){
    List<String> a = [];
    List<String> x = Constants.letters;
    a.addAll(_word.letters!);
    var lenght     = a.length;
    var result     = 12 - lenght ;
    x.shuffle();
    for(int i = 0; i < result; i++){a.add(x[i]);}
    a.shuffle();
    _lettersOptions = a;
    update();
  }

  ///Animations
  final int _rewarMount   =   10;
  int get rewarMount      =>  _rewarMount;
  
  bool _rewardActive                    = false;
  bool  get rewardActive                => _rewardActive;
  set rewardActive(data){_rewardActive  = _rewardActive ? false : true; update();}

  List<double> positionA  =   [0.0, 0.0];
  List<double> positionB  =   [0.0, 0.0];
  List<double> positionC  =   [0.0, 0.0];
  List<double> positionD  =   [0.0, 0.0];
  List<double> positionE  =   [0.0, 0.0];
  List<double> positionF  =   [0.0, 0.0];
  List<double> positionG  =   [0.0, 0.0];


  getWidgetPositions( x, y, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6,){
    positionA = [x,y];
    positionB = [x1,y1];
    positionC = [x2,y2];
    positionD = [x3,y3];
    positionE = [x4,y4];
    positionF = [x5,y6];
    positionG = [x6,y5];
    update();
  }

   setRewardPosition() {
    var    x = [positionE, positionC , positionD, positionF, positionG];
           x.shuffle();
    return x[0];
  }


}