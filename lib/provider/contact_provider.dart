import 'package:contact_number_app/modal/contact_modal.dart';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';

class ContactProvider with ChangeNotifier{
  int stepIndex=0;
  String? ImagePath;
  int? updateIndex;

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

  void editData(ContactModal c1){
    contactList[updateIndex!]=c1;
    notifyListeners();
  }

  void storeIndex(int index)
  {
   updateIndex=index;
    notifyListeners();
  }

  void deleteData(){
    contactList.removeAt(updateIndex!);
    notifyListeners();
  }

  Future<void> share(ContactModal c1) async {
    Share.share("${c1.name} \n ${c1.number}");
    ShareResult result = await Share.shareWithResult("");
  }
}