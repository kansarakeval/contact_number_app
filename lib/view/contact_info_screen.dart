import 'dart:io';
import 'package:contact_number_app/modal/contact_modal.dart';
import 'package:contact_number_app/provider/contact_provider.dart';
import 'package:contact_number_app/widget/alter_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({super.key});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  ContactProvider? providerw;
  ContactProvider? providerr;

  bool islock=false;

  @override
  Widget build(BuildContext context) {
    providerw = context.watch<ContactProvider>();
    providerr = context.read<ContactProvider>();
    ContactModal c1 =
        ModalRoute.of(context)!.settings.arguments as ContactModal;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showWidget(context, c1);
              },
              icon: Icon(Icons.mode_edit_outline_outlined),
            ),
            IconButton(
              onPressed: () {
                providerr!.deleteData();
                Navigator.pop(context);
              },
              icon: Icon(Icons.delete_outline_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              c1.image == null
                  ? CircleAvatar(
                      radius: 80,
                      child: Text(
                        "${c1.name?.substring(0, 1).toUpperCase()}",
                        style: TextStyle(fontSize: 40),
                      ),
                    )
                  : CircleAvatar(
                      radius: 80,
                      backgroundImage: FileImage(File("${c1.image}")),
                    ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${c1.name}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.grey.shade200),
                    child: IconButton(
                        onPressed: () async {
                          Uri uri = Uri.parse("tel:+91${c1.number}");
                          await launchUrl(uri);
                        },
                        icon: Icon(Icons.call_outlined)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.grey.shade200),
                    child: IconButton(onPressed: ()async {
                      Uri uri = Uri.parse("sms:+91${c1.number}");
                      await launchUrl(uri);
                    }, icon: Icon(Icons.chat_outlined)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.grey.shade200),
                    child: IconButton(
                        onPressed: ()async {
                          Uri uri = Uri.parse("mailto:${c1.email}");
                          await launchUrl(uri);
                        },
                        icon: Icon(Icons.mail_outline),),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.grey.shade200),
                    child: IconButton(
                        onPressed: () {
                          providerr!.share(c1);
                        },
                        icon: Icon(Icons.share_outlined),),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.grey.shade200),
                      child: IconButton(onPressed: () {
                        providerr!.hideContact();
                        Navigator.pop(context);
                      }, icon: islock?Icon(Icons.lock_open_sharp):Icon(Icons.lock_outline),),),

                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: MediaQuery.sizeOf(context).height * 0.40,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade100),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Contact info",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.call_outlined),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "+91 ${c1.number}",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                "phone",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.video_camera_back_outlined),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.mail_outline),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image(
                            image: AssetImage("assets/img/whatsapp.png"),
                            height: 25,
                            width: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Message +91 ${c1.number}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image(
                            image: AssetImage("assets/img/whatsapp.png"),
                            height: 25,
                            width: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "voice call +91 ${c1.number}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image(
                            image: AssetImage("assets/img/whatsapp.png"),
                            height: 25,
                            width: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "voice call +91 ${c1.number}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${c1.email}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
