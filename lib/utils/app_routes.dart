import 'package:contact_number_app/view/addcontact_screen.dart';
import 'package:contact_number_app/view/contact_screen.dart';
import 'package:contact_number_app/view/intro_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:introduction_screen/introduction_screen.dart';

Map<String, WidgetBuilder> screen_routes = {
  '/': (context) => IntroScreen(),
  'contact': (context) =>  ContactScreen(),
  'addContact': (context) => const AddContectScreen(),
};
