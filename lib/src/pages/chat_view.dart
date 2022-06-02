import 'package:chat_u/src/config/ktext.dart';
import 'package:chat_u/src/model/chat.dart';
import 'package:chat_u/src/pages/singlechat_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Scaffold(
      backgroundColor: Colors.white,
    floatingActionButton: SpeedDial(
    backgroundColor:HexColor('#5BB509'),
    animatedIcon: AnimatedIcons.menu_close,
    children: [
      SpeedDialChild(
        child: Icon(Icons.person_add,color: HexColor('#5BB509'),)
      ),
      SpeedDialChild(
        child: Icon(Icons.question_answer,color: HexColor('#5BB509'),)
      ),
    ],
    ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Message chat = chats[index];
          return GestureDetector(
            onTap: () => Get.to(() => SingleChatPage(
                  user: chat.sender,
                )),
            child: Container(
              // circle image
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                children: [
                Container(
                  padding: EdgeInsets.all(2),
                  // condition circle read/unread message color
                  decoration: chat.unread
                      ? BoxDecoration(
                          border: Border.all(width: 2, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              )
                            ])
                      : BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          )
                        ]),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(chat.sender.imageUrl),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(
                        text: chat.sender.name,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                       Container(
                         width: size.width*0.40,
                         child: KText(
                           color: Colors.black54,
                           fontSize: 12,
                           text: chat.text,
                           maxLines: 3,
                           
                         ),
                       ),
                      // time
                      
                     
                     
                    ],
                  ),
                ),
                SizedBox(width: size.width*0.14,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KText(
                      text: chat.time,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  chat.sender.isOnline?
                     Padding(
                       padding:  EdgeInsets.only(left: 18),
                       child: Container(
                       height: 20,
                       width: 30,
                       decoration: BoxDecoration(
                         color: HexColor('#5BB509'),
                         borderRadius: BorderRadius.circular(5)
                       ),
                       child: Center(child: KText(text: chat.number.toString(),color: Colors.white,)),
                       ),
                     ):
                     Container(child: null,)
                    // time
                    
                   
                   
                  ],
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}