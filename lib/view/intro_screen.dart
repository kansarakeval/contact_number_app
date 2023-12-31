import 'package:contact_number_app/utils/share_helper.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Introduction page",
              body: "welcome to the contact application",
            ),
            PageViewModel(
                title: "Introduction page",
                body: "welcome to the contact diary"
            ),
          ],
          showDoneButton: true,
          onDone: (){
            ShareHelper shr = ShareHelper();
            shr.setIntroStatus();
            Navigator.pushReplacementNamed(context, 'contact');
          },
          done: Text("Done"),
          next: Text("Next"),
        ),
      ),
    );
  }
}
