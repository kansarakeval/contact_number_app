import 'dart:io';
import 'package:contact_number_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddContectScreen extends StatefulWidget {
  const AddContectScreen({super.key});

  @override
  State<AddContectScreen> createState() => _AddContectScreenState();
}

class _AddContectScreenState extends State<AddContectScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Contect"),
        ),
        body: Consumer<ContactProvider>(
          builder: (context, value, child) => Stepper(
            currentStep: value.stepIndex,
            onStepContinue: () {
              value.nextstep();
            },
            onStepCancel: (){
              value.cancetstep();
            },
            steps:  [
              Step(
                title: const Text("add image"),
                content: Column(
                  children: [
                    CircleAvatar(radius: 50,
                      backgroundImage: value.ImagePath != null
                          ? FileImage(File(value.ImagePath!))
                          : null,),
                    Consumer<ContactProvider>(builder: (context, value, child) => IconButton(onPressed: () async {
                      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        value.setImagePath(pickedFile.path);
                      }
                    },icon:const Icon(Icons.image_outlined) ),
                    )
                  ],
                ),
              ),
              const Step(
                title: Text("Contect Name"),
                content: TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              const Step(
                title: Text("Contact Number"),
                content: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              const Step(
                title: Text("contact Email"),
                content: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
