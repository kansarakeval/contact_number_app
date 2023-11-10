import 'dart:io';
import 'package:contact_number_app/provider/contact_provider.dart';
import 'package:contact_number_app/provider/theme_provider.dart';
import 'package:contact_number_app/utils/share_helper.dart';
import 'package:contact_number_app/view/hidden_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  ContactProvider? providerw;
  ContactProvider? providerr;
  bool bioMatrix =true;

  Future<void> logout() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool("login", false);
  }

  @override
  Widget build(BuildContext context) {
    providerw = context.watch<ContactProvider>();
    providerr = context.read<ContactProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              if(bioMatrix){
                providerr!.bioMatrix();
              }
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HiddenScreen(),));
            },
            icon: Icon(Icons.remove_red_eye_outlined),
          ),
          title: const Text("Contact App"),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                logout();
                Navigator.pushReplacementNamed(context, 'login');
              },
            ),
            Consumer<ThemeProvider>(
              builder: (context, value1, child) => Switch(
                value: value1.islight,
                onChanged: (value) {
                  ShareHelper shr = ShareHelper();
                  shr.setTheme(value);
                  value1.changeTheme();
                },
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: providerw!.contactList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                providerr!.storeIndex(index);
                Navigator.pushNamed(context, 'contactinfo',
                    arguments: providerr!.contactList[index]);
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.10,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        providerw!.contactList[index].image != null
                            ? CircleAvatar(
                                radius: 30,
                                backgroundImage: FileImage(
                                  File(
                                      "${providerw!.contactList[index].image}"),
                                ),
                              )
                            : CircleAvatar(
                                radius: 30,
                                child: Text(
                                  "${providerw!.contactList[index].name!.substring(0, 1).toUpperCase()}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${providerr!.contactList[index].name}",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              "${providerr!.contactList[index].number}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'addContact');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
