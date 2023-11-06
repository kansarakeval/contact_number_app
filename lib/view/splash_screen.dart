import 'package:contact_number_app/utils/share_helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? status;

  @override
  void initState() {
    super.initState();
    createdata();
  }

  void createdata() async {
    ShareHelper shr = ShareHelper();
    status = await shr.getIntroStatus();

  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds:3),
      () {
        // Navigator.pushReplacementNamed(context, status == false || status == null ? 'intro' : 'login'  );
        Navigator.pushReplacementNamed(context, status == false || status == null ? 'login' : 'contact' );
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset(
            "assets/img/img1.png",
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
