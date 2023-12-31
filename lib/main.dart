import 'package:contact_number_app/provider/contact_provider.dart';
import 'package:contact_number_app/provider/theme_provider.dart';
import 'package:contact_number_app/utils/app_routes.dart';
import 'package:contact_number_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(),),
        ChangeNotifierProvider(create: (context) => ContactProvider(),),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          value.changeTheme();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: value.islight ? lightTheme : darkTheme,
            routes: screen_routes,
          );
        }
      ),
    ),
  );
}
