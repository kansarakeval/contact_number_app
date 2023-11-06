import 'package:contact_number_app/view/addcontact_screen.dart';
import 'package:contact_number_app/view/contact_info_screen.dart';
import 'package:contact_number_app/view/contact_screen.dart';
import 'package:contact_number_app/view/intro_screen.dart';
import 'package:contact_number_app/view/login_screen.dart';
import 'package:contact_number_app/view/register_screen.dart';
import 'package:contact_number_app/view/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:introduction_screen/introduction_screen.dart';

Map<String, WidgetBuilder> screen_routes = {
  '/':(context) => SplashScreen(),
  'intro': (context) => IntroScreen(),
  'contact': (context) =>  ContactScreen(),
  'addContact': (context) => AddContectScreen(),
  'login': (context) => LoginScreen(),
  'register': (context) => RegisterScreen(),
  'contactinfo': (context) => ContactInfoScreen(),
};
