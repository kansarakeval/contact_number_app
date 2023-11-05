import 'package:contact_number_app/modal/contact_modal.dart';
import 'package:flutter/foundation.dart';

class ContactProvider with ChangeNotifier{
  int stepIndex=0;
  String? ImagePath;

  List<ContactModal> contactList=[];

  void nextstep(){
    if(stepIndex < 4){
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

  void cancetclin(){
    stepIndex = 0;
    notifyListeners();
  }
  void setImagePath(String? path) {
    ImagePath = path;
    notifyListeners();
  }

  void contactadd(ContactModal cm){
    contactList.add(cm);
    notifyListeners();
  }

}