import 'package:chat_u/src/config/ktext.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AccountPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: Container(
          decoration: BoxDecoration(
            color: HexColor('#5BB509'),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),),
          ),
          child: Column(
            children: [
              SizedBox(height: 30,),
           Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color:Colors.white,width: 2),
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/women_1.jpg'),fit: BoxFit.fill,)
              ),
            ),
            SizedBox(height: 5,),
            KText(text: 'Nikita',color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold,),
            SizedBox(height: 3,),
            KText(text: '+91445454655',color:Colors.white54,fontSize: 18,),

            ],
          ),
        ),
        ),
        body: ListView(
          children: [
            ListTile(
              title: KText(text: 'Info',color: HexColor('#5BB509'),fontSize: 18,fontWeight: FontWeight.bold,),
              subtitle: KText(text: 'Spring is coming 🌱',fontSize: 15,fontWeight: FontWeight.bold,),
            ),
            ListTile(
              leading: Icon(Icons.notifications_outlined,color:HexColor('#5BB509') ,),
              title: KText(text: 'Notifications',color: HexColor('#5BB509'),fontSize: 18,fontWeight: FontWeight.bold,),
              subtitle: KText(text: 'On',fontSize: 15,fontWeight: FontWeight.bold,),
            ),
            ListTile(
              leading: Icon(Icons.model_training,color:HexColor('#5BB509') ,),
              title: KText(text: 'Self Deleting Mesages',color: HexColor('#5BB509'),fontSize: 18,fontWeight: FontWeight.bold,),
              subtitle: KText(text: 'On',fontSize: 15,fontWeight: FontWeight.bold,),
            ),
            ListTile(
              leading: Icon(Icons.audiotrack_outlined,color:HexColor('#5BB509') ,),
              title: KText(text: 'Custom notifications',color: HexColor('#5BB509'),fontSize: 18,fontWeight: FontWeight.bold,),
            ),
            ListTile(
              leading: Icon(Icons.lock,color:HexColor('#5BB509') ,),
              title: KText(text: 'Encryption',color: HexColor('#5BB509'),fontSize: 18,fontWeight: FontWeight.bold,),
              subtitle: KText(text: 'Messages and calls are end-to-end encrypted. Tap to verify',fontSize: 15,),

            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: KText(text: '2 group in common'),
            ),
             ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/women_1.jpg'),
              ),
              title: KText(text: 'Eva Team',color: HexColor('#5BB509'),fontSize: 18,fontWeight: FontWeight.bold,),
              subtitle: KText(text: 'Paul, John Smith, lauren, Joe',fontSize: 15,),

            ),
          ], 
        ),
    );
  }
}