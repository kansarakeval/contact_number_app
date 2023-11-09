import 'dart:io';

import 'package:contact_number_app/modal/contact_modal.dart';
import 'package:contact_number_app/provider/contact_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

void showWidget(BuildContext context, ContactModal c1) {
  TextEditingController txtName = TextEditingController(text: c1.name);
  TextEditingController txtEmail = TextEditingController(text: c1.email);
  TextEditingController txtNumber = TextEditingController(text: c1.number);
  ContactProvider? providerr;
  providerr = context.read<ContactProvider>();
  showDialog(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          alignment: Alignment.center,
          title: const Text("Update Contact"),
          actions: [
            Align(
              alignment: Alignment.center,
              child: c1.image != null || providerr!.ImagePath != null
                  ? CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(
                        File("${c1.image}"),
                      ),
                    )
                  : CircleAvatar(
                      radius: 50,
                      child: Text(
                        "${c1.name?.substring(0, 1).toUpperCase()}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
            ),
            Align(
              alignment: Alignment.center,
              child: IconButton(
                  onPressed: () async {
                    ImagePicker picker = ImagePicker();
                    XFile? image=await picker.pickImage(source: ImageSource.gallery);
                    providerr!.setImagePath(image!.path);
                  },
                  icon: const Icon(Icons.image_outlined)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Name"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtNumber,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Number"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtEmail,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                ContactModal up = ContactModal(
                    name: txtName.text,
                    number: txtNumber.text,
                    email: txtEmail.text,
                    image: c1.image);
                context.read<ContactProvider>().editData(up);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
          ],
        ),
      );
    },
  );
}
