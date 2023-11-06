import 'dart:io';

import 'package:contact_number_app/modal/contact_modal.dart';
import 'package:flutter/material.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({super.key});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  @override
  Widget build(BuildContext context) {
    ContactModal c1 = ModalRoute.of(context)!.settings.arguments as ContactModal;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.edit),),
            IconButton(onPressed: (){}, icon: Icon(Icons.delete),),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            c1.image == null?CircleAvatar(
              radius: 80,
              child: Text("${c1.name?.substring(0,1).toUpperCase()}",style: TextStyle(fontSize: 40),),
            ):CircleAvatar(
              radius: 80,
              backgroundImage: FileImage(File("${c1.image}")),
            ),
            SizedBox(height: 20,),
            Text("${c1.name}",style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.call)),
                SizedBox(width: 20,),
                IconButton(onPressed: (){}, icon: Icon(Icons.mail_outline)),
                SizedBox(width: 20,),
                IconButton(onPressed: (){}, icon: Icon(Icons.video_camera_front_sharp)),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.all(10),
              height: MediaQuery.sizeOf(context).height*0.40,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.shade300),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Contact info",style: Theme.of(context).textTheme.titleLarge,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.call),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("+91 ${c1.number}",style: Theme.of(context).textTheme.titleMedium,),
                            Text("phone",style: Theme.of(context).textTheme.titleSmall,),
                          ],
                        ),
                        Spacer(),
                        IconButton(onPressed: (){}, icon: Icon(Icons.video_camera_front_rounded),),
                        IconButton(onPressed: (){}, icon: Icon(Icons.mail_outline),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.perm_phone_msg,color: Colors.green),
                        SizedBox(width: 10,),
                        Text("Message +91 ${c1.number}",style: Theme.of(context).textTheme.titleMedium,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.settings_phone_outlined,color: Colors.green),
                        SizedBox(width: 10,),
                        Text("voice call +91 ${c1.number}",style: Theme.of(context).textTheme.titleMedium,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.missed_video_call,color: Colors.green),
                        SizedBox(width: 10,),
                        Text("voice call +91 ${c1.number}",style: Theme.of(context).textTheme.titleMedium,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.centerLeft,
                        child: Text("${c1.email}",style: Theme.of(context).textTheme.titleMedium,))
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
