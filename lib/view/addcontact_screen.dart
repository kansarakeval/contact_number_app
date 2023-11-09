// import 'dart:io';
// import 'package:contact_number_app/modal/contact_modal.dart';
// import 'package:contact_number_app/provider/contact_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
//
// class AddContectScreen extends StatefulWidget {
//   const AddContectScreen({super.key});
//
//   @override
//   State<AddContectScreen> createState() => _AddContectScreenState();
// }
//
// class _AddContectScreenState extends State<AddContectScreen> {
//   ContactProvider? providerW;
//   ContactProvider? providerR;
//
//   TextEditingController txtname = TextEditingController();
//   TextEditingController txtnumber = TextEditingController();
//   TextEditingController txtemail = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     providerW = context.watch<ContactProvider>();
//     providerR = context.read<ContactProvider>();
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Add Contect"),
//         ),
//         body: Stepper(
//           currentStep: providerW!.stepIndex,
//           onStepContinue: () {
//             providerW!.nextstep();
//           },
//           onStepCancel: () {
//             providerR!.cancetstep();
//           },
//           steps: [
//             Step(
//               title: const Text("add image"),
//               content: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: providerW!.ImagePath != null
//                         ? FileImage(File(providerW!.ImagePath!))
//                         : null,
//                   ),
//                   Consumer<ContactProvider>(
//                     builder: (context, value, child) => IconButton(
//                         onPressed: () async {
//                           final pickedFile = await ImagePicker()
//                               .pickImage(source: ImageSource.gallery);
//                           if (pickedFile != null) {
//                             value.setImagePath(pickedFile.path);
//                           }
//                         },
//                         icon: const Icon(Icons.image_outlined)),
//                   )
//                 ],
//               ),
//             ),
//             Step(
//               title: Text("Contect Name"),
//               content: TextField(
//                 controller: txtname,
//                 keyboardType: TextInputType.name,
//                 decoration: InputDecoration(border: OutlineInputBorder()),
//               ),
//             ),
//             Step(
//               title: Text("Contact Number"),
//               content: TextField(
//                 controller: txtnumber,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(border: OutlineInputBorder()),
//
//               ),
//             ),
//             Step(
//               title: Text("contact Email"),
//               content: TextField(
//                 controller: txtemail,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(border: OutlineInputBorder()),
//               ),
//             ),
//             Step(
//               title: Text("Sabmit"),
//               content: ElevatedButton(
//                 onPressed: () {
//                   ContactModal cm = ContactModal(
//                     name: txtname.text,
//                     number: txtnumber.text,
//                     email: txtemail.text,
//                     image: providerW!.ImagePath,
//                   );
//                   providerR!.setImagePath(null);
//                   providerR!.contactadd(cm);
//                   Navigator.pop(context);
//                   providerR!.cancetclin();
//                 },
//                 child: Text("save"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:contact_number_app/modal/contact_modal.dart';
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
  ContactProvider? providerW;
  ContactProvider? providerR;
  TextEditingController txtname = TextEditingController();
  TextEditingController txtnumber = TextEditingController();
  TextEditingController txtemail = TextEditingController();

  GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  GlobalKey<FormState> numberKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<ContactProvider>();
    providerR = context.read<ContactProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Contact"),
        ),
        body: Stepper(
          currentStep: providerW!.stepIndex,
          onStepContinue: () {
            if (providerW!.stepIndex == 1) {
              if (nameKey.currentState!.validate()) {
                providerW!.nextstep();
              }
            } else if(providerW!.stepIndex == 2){
              if (numberKey.currentState!.validate()){
                providerW!.nextstep();
              }
            }
            else {
              providerW!.nextstep();
            }
          },
          onStepCancel: () {
            providerR!.cancetstep();
          },
          steps: [
            Step(
              title: const Text("Add image"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: providerW!.ImagePath != null
                        ? FileImage(File(providerW!.ImagePath!))
                        : null,
                  ),
                  Consumer<ContactProvider>(
                    builder: (context, value, child) => IconButton(
                        onPressed: () async {
                          final pickedFile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedFile != null) {
                            value.setImagePath(pickedFile.path);
                          }
                        },
                        icon: const Icon(Icons.image_outlined)),
                  )
                ],
              ),
            ),
            Step(
              title: Text("Contact Name"),
              content: Form(
                key: nameKey,
                child: TextFormField(
                  controller: txtname,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter name';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Step(
              title: Text("Contact Number"),
              content: Form(
                key: numberKey,
                child: TextFormField(
                  controller: txtnumber,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter number';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Step(
              title: Text("Contact Email"),
              content: TextFormField(
                controller: txtemail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            Step(
              title: Text("Submit"),
              content: ElevatedButton(
                onPressed: () {
                  ContactModal cm = ContactModal(
                    name: txtname.text,
                    number: txtnumber.text,
                    email: txtemail.text,
                    image: providerW!.ImagePath,
                  );
                  providerR!.setImagePath(null);
                  providerR!.contactadd(cm);
                  Navigator.pop(context);
                  providerR!.cancetclin();
                },
                child: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
