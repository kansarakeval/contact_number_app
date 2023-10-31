import 'package:flutter/foundation.dart';

class ContactProvider with ChangeNotifier{
  int stepIndex=0;
  String? ImagePath;

  void nextstep(){
    if(stepIndex < 3){
      stepIndex++;
    }
    notifyListeners();
  }

  void cancetstep(){
    if(stepIndex  > 0){
      stepIndex--;
    }
    notifyListeners();
  }


  void setImagePath(String? path) {
    ImagePath = path;
    notifyListeners();
  }
}