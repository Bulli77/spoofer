
import 'package:chat_u/src/config/ktext.dart';
import 'package:chat_u/src/model/chat.dart';
import 'package:chat_u/src/model/user.dart';
import 'package:chat_u/src/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class SingleChatPage extends StatefulWidget {
  final User user;
  SingleChatPage({required this.user});
  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  bool isSearching =false;
  final Size size = Get.size;
// user chat message
  _chat(
    Message message,
    bool isMe,
    bool isSameUser,
  ) {
    if (isMe) {
      return Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(maxWidth: size.width * 0.80),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: HexColor('#53270A'),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),bottomLeft: Radius.circular(40),topRight: Radius.circular(40)),
                
                 ),
              child: KText(
                // user message
                text: message.text,
                color: Colors.white,
                maxLines: 3,
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    KText(
                      text: message.time,
                      color: Colors.black45,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      // condition circle read/unread message color
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            )
                          ]),
                    ),
                  ],
                )
              : Container(
                  child:null
                ),
        ],
      );
    } else {
      return Column(children: [
        Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Container(
                constraints: BoxConstraints(maxWidth: size.width * 0.80),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: HexColor('#5BB509'),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40),bottomRight: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      )
                    ]),
                child: KText(
                  text: message.text,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  maxLines: 3,
                ),
              ),
            ),
               
          ],
        )
      ]);
    }
  }

// send message area
  // _send() {
  //   return Row(
  //     children: [
      
      
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    int preUserId;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
preferredSize: Size.fromHeight(150),
child: Container(
  decoration: BoxDecoration(
    color:  HexColor('#5BB509'),
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),),
  ),
  child: Column(
    children: [
      SizedBox(height: 25,),
    isSearching? Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 50),
            padding: EdgeInsets.only(left: 10,),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white38,
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.white,
                ),
                suffixIcon: Icon(Icons.filter_alt,color: Colors.white,),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.black54),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ):     Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,))
          ],
        ),
      ),
      SizedBox(height: 35,),
    Row(
      children: [
        SizedBox(width: 17,),
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(widget.user.imageUrl),
        ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KText(text: widget.user.name,color: Colors.white,fontSize: 15,),
            KText(text: '+91445454655',color: Colors.white54,fontSize: 12,)
          ],
        ),
         SizedBox(width: size.width*0.36,),
      isSearching?IconButton(onPressed: (){
        setState(() {
          this.isSearching =!this.isSearching;
        });
      }, icon: Icon(Icons.close,color: Colors.white,)) : IconButton(onPressed: (){
          setState(() {
            this.isSearching =!this.isSearching;
          });
        }, icon: Icon(Icons.search,color: Colors.white,size: 30,)),
    Theme (
      data: Theme.of(context).copyWith(
            cardColor: Colors.indigo,
            iconTheme: IconThemeData(color: Colors.white),
      ),
       child: ListTileTheme (
         iconColor: Colors.white,
          child: PopupMenuButton(
            
            color:HexColor('#5BB509'),
            itemBuilder: (context)=>[
            PopupMenuItem(
              value: 0,
              child: KText(text: 'Settings',color: Colors.white,)
              ),
            PopupMenuItem(
              value: 1,
              child: KText(text: 'New group',color: Colors.white,)
              ),
            PopupMenuItem(
              value: 2,
              child: KText(text: 'New broadcast',color: Colors.white,)
              ),
            PopupMenuItem(
              value: 3,
              child: KText(text: 'Starred messages',color: Colors.white,)
              ),
            
          ],onSelected: (item)=>selectedItem(context, item),
          
          ),
        ),
     ),
      ],
    ),
    ],
  ),
),
       ),
      body: Column(
        children: [
          Expanded(
         flex: 1,
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(15),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = messages[index];

                final bool isMe = message.sender.id == currentUser.id;
                preUserId = message.sender.id;

                final bool isSameUser = preUserId == message.sender.id;

                return _chat(message, isMe, isSameUser);
              },
            ),
          ),
          Row(
            children: [
              Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20,bottom: 15),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 50,
          width: size.width*0.70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[200],
          ),
          child: TextField(
            decoration: InputDecoration(

              hintText: "Send Messege",
              hintStyle: TextStyle(color: HexColor('#5BB509'),),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Container(
                    margin: EdgeInsets.only(bottom: 15),

          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: HexColor('#5BB509'),
            shape: BoxShape.circle,
          ),
          child: Center(child:Icon(Icons.send,color: Colors.white,),),
        )
            ],
          )
        ],
      ),
    );
  }
  
  selectedItem(BuildContext context, item){
    switch (item) {
      case 0: Get.to(SettingPage());
        
      break;
      case 1: print('object');
        
      break;
      case 2: print('object');
        
      break;
      case 3: print('object');
        
      break;
    }
  }
  // Future openDialog()=> showDialog(
  //   context: context,
  //    builder: (context)=> Dialog(
  //      insetPadding: EdgeInsets.symmetric(horizontal: 50),
  //      backgroundColor: HexColor('#5BB509'),
  //      child: Column(
  //        crossAxisAlignment: CrossAxisAlignment.start,
  //        mainAxisSize: MainAxisSize.min,
  //        children: [
  //          TextButton(onPressed: (){
  //            Get.to(SettingPage());
  //          }, child: KText(text: 'Settings',color: Colors.white,fontSize: 18,)),
  //          TextButton(onPressed: (){}, child: KText(text: 'New Group',color: Colors.white,fontSize: 18,)),
  //          TextButton(onPressed: (){}, child: KText(text: 'New broadcast',color: Colors.white,fontSize: 18,)),
  //          TextButton(onPressed: (){}, child: KText(text: 'Starred messages ',color: Colors.white,fontSize: 18,)),
  //        ],
  //      ),
  //    )
  //    );
}