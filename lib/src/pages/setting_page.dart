import 'package:chat_u/src/config/ktext.dart';
import 'package:chat_u/src/pages/accountPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: Container(
          decoration: BoxDecoration(
            color: HexColor('#5BB509'),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Row(
                  children: [
                    IconButton(icon:Icon(Icons.arrow_back_ios,color: Colors.white),onPressed: (){
                      Get.back();
                    },),
                    KText(text: 'Setting',fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,)
                  ],
                ),
                Divider(
                  color: Colors.white,
                  thickness: .1,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/women_1.jpg'),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(text: 'Nikita',color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,),
                        KText(text: 'Spring is coming',color: Colors.white38,fontSize: 18,fontWeight: FontWeight.bold,),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        ),
        body: ListView(
          children: [
            ListTile(
              onTap: (){
                Get.to(AccountPage());
              },
            leading: Image.asset('assets/Vector.png'),
            title: Padding(
              padding:  EdgeInsets.only(bottom: 10.0),
              child: KText(text: 'Account',color:HexColor('#5BB509'),fontSize: 18,fontWeight: FontWeight.bold,),
            ),
            subtitle: KText(text: 'Privacy,Security'),


            ),
            ListTile(
            leading: Image.asset('assets/Vector1.png'),
            title: Padding(
              padding:  EdgeInsets.only(bottom: 10),
              child: KText(text: 'Chats',color:HexColor('#5BB509'),fontSize: 18,fontWeight: FontWeight.bold,),
            ),
            subtitle: KText(text: 'Chat history'),


            ),
            ListTile(
            leading: Image.asset('assets/Vector2.png'),
            title: Padding(
              padding:  EdgeInsets.only(bottom: 10),
              child: KText(text: 'Notifications',color:HexColor('#5BB509'),fontSize: 18,fontWeight: FontWeight.bold,),
            ),
            subtitle: KText(text: 'Messeages,group'),


            ),
            ListTile(
            leading: Image.asset('assets/Vector3.png'),
            title: Padding(
              padding:  EdgeInsets.only(bottom: 10),
              child: KText(text: 'Help',color:HexColor('#5BB509'),fontSize: 18,fontWeight: FontWeight.bold,),
            ),
            subtitle: KText(text: 'Help center, contact us, privacy policy'),


            ),
           SizedBox(height: 150,),
            Center(child: KText(text: 'brought to you by\n        ISEEU',color:HexColor('#5BB509'),fontSize: 18,fontWeight: FontWeight.bold,)),
          ],
        ),
    );
  }
}