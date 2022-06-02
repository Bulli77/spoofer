
import 'package:chat_u/src/config/ktext.dart';
import 'package:chat_u/src/pages/chat_view.dart';
import 'package:chat_u/src/pages/group_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ChatPage extends StatefulWidget {

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
              backgroundColor: Colors.white,
    
        appBar: PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: AppBar(
        actions: [
        isSearching? Padding(
            padding:  EdgeInsets.only(right: 10),
            child: GestureDetector (
              onTap: (){
                setState(() {
                  this.isSearching = !this.isSearching;
                });
              },
               child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: Center(child: Icon(Icons.close,color: Colors.black,),),
                        ),
             ),
          ): Padding(
            padding:  EdgeInsets.only(right: 10),
            child: GestureDetector (
              onTap: (){
                setState(() {
                  this.isSearching = !this.isSearching;
                });
              },
               child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: Center(child: Icon(Icons.search_outlined,color: Colors.black,),),
                        ),
             ),
          
          
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Column(
          children: [
            SizedBox(height: size.height*0.04,),
          isSearching?   Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 50),
            padding: EdgeInsets.only(left: 10,),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HexColor('#5BB509'),
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
          ):  
          Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Image.asset('assets/logo.png',width: 50,),
                  SizedBox(width: 3,),
                
                KText(
                text: 'I Chat U',
                fontSize: 15,
                color: HexColor('#5BB509'),
                fontWeight: FontWeight.bold,
              ),
              SizedBox(width: size.width*0.55,),
              
                ],
              ),
            )
          
          ],
        ),
        bottom:  TabBar(
          
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black54,
          indicatorPadding: EdgeInsets.all(15),
                    indicatorColor: HexColor('#5BB509'),
                    indicatorWeight: 3,
                    tabs: [
                      Tab(
                        child: KText(text: 'ALL'),
                      ),
                      Tab(
                        child: KText(text: 'CHATS'),
                      ),
                      Tab(
                        child: KText(text: 'GROUP'),
                      ),
                    ]),
              ),
      ),
      body:  TabBarView(children: [
            ChatView(),
            ChatView(),
            GroupView(),
      ],
      )
      ),
    );
    
  }
}