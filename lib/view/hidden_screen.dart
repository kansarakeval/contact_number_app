import 'dart:io';
import 'package:contact_number_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HiddenScreen extends StatefulWidget {
  const HiddenScreen({super.key});

  @override
  State<HiddenScreen> createState() => _HiddenScreenState();
}

class _HiddenScreenState extends State<HiddenScreen> {
  ContactProvider? providerw;
  ContactProvider? providerr;
  @override
  Widget build(BuildContext context) {
    providerw = context.watch<ContactProvider>();
    providerr = context.read<ContactProvider>();
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Hidden Screen"),
      ),
      body: ListView.builder(
        itemCount: providerw!.hideContactList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              providerr!.islock = true;
              providerr!.storeIndex(index);
              Navigator.pushNamed(context, 'contactinfo',
                  arguments: providerr!.hideContactList[index]);
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
                      providerw!.hideContactList[index].image != null
                          ? CircleAvatar(
                        radius: 30,
                        backgroundImage: FileImage(
                          File(
                              "${providerw!.hideContactList[index].image}"),
                        ),
                      )
                          : CircleAvatar(
                        radius: 30,
                        child: Text(
                          "${providerw!.hideContactList[index].name!.substring(0, 1).toUpperCase()}",
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
                            "${providerr!.hideContactList[index].name}",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            "${providerr!.hideContactList[index].number}",
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
    ),);
  }
}
