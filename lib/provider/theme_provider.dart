import 'package:contact_number_app/utils/share_helper.dart';
import 'package:flutter/cupertino.dart';

class ThemeProvider with ChangeNotifier
{
  bool islight = false;

  void changeTheme()
  async{
    ShareHelper shr= ShareHelper();
    bool? istheme = await shr.getTheme();
    islight = istheme ?? false;
    notifyListeners();
  }
}