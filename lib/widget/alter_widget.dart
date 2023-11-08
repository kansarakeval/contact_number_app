import 'package:contact_number_app/modal/contact_modal.dart';
import 'package:contact_number_app/provider/contact_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showWidget(BuildContext context, ContactModal c1) {
  TextEditingController txtName = TextEditingController(text: c1.name);
  TextEditingController txtEmail = TextEditingController(text: c1.email);
  TextEditingController txtNumber = TextEditingController(text: c1.number);
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        alignment: Alignment.bottomCenter,
        title: Text("Update Contact"),
        actions: [
          TextField(
            controller: txtName,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Name"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: txtNumber,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Number"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: txtEmail,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Email"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              ContactModal c1 = ContactModal();
              c1.name=txtName.text;
              c1.number=txtNumber.text;
              c1.email=txtEmail.text;
              context.read<ContactProvider>().editData(c1);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text("Update"),
          ),
        ],
      );
    },
  );
}
