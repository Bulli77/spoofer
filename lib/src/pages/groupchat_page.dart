import 'package:chat_u/src/config/ktext.dart';
import 'package:chat_u/src/model/chat.dart';
import 'package:chat_u/src/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class GroupChatPage extends StatefulWidget {
  final User user;
  GroupChatPage({required this.user});
  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  bool isSearching = false;
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
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
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
              : Container(child: null),
        ],
      );
    } else {
      return Column(children: [
        Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets\/women_1.jpg'),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: size.width * 0.80),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: HexColor('#5BB509'),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
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
        preferredSize: Size.fromHeight(100),
        child: Container(
          decoration: BoxDecoration(
            color: HexColor('#5BB509'),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 20),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(widget.user.imageUrl),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  KText(
                    text: widget.user.name,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  KText(
                    text: '+91445454655',
                    color: Colors.white54,
                    fontSize: 12,
                  )
                ],
              ),
              SizedBox(
                width: size.width * 0.35,
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  cardColor: Colors.indigo,
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                child: ListTileTheme(
                  iconColor: Colors.white,
                  child: PopupMenuButton(
                    color: HexColor('#5BB509'),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          value: 0,
                          child: KText(
                            text: 'Group info',
                            color: Colors.white,
                          )),
                      PopupMenuItem(
                          value: 1,
                          child: KText(
                            text: 'Search',
                            color: Colors.white,
                          )),
                      PopupMenuItem(
                          value: 2,
                          child: KText(
                            text: 'Mute notifications',
                            color: Colors.white,
                          )),
                      PopupMenuItem(
                        value: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            KText(
                              text: 'More',
                              color: Colors.white,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  showMenu(
                                      color: HexColor('#5BB509'),
                                      context: context,
                                      position: RelativeRect.fromLTRB(
                                          25.0, 25.0, 0.0, 0.0),
                                      items: <PopupMenuEntry>[
                                        PopupMenuItem(
                                          value: 0,
                                          child:  KText(text:"Report",   color: Colors.white,),
                                         
                                        ),
                                        PopupMenuItem(
                                          value: 1,
                                          child:KText(text:"Exit group",color: Colors.white,),
                                           
                                        ),
                                        PopupMenuItem(
                                          value: 2,
                                          child:
                                              KText(text:"Clear chat",color: Colors.white,),
                                         
                                        ),
                                        PopupMenuItem(
                                          value: 3,
                                          child: 
                                              KText(text:"Export chat",color: Colors.white,),
                                           
                                        ),
                                        PopupMenuItem(
                                          value: 4,
                                          child: 
                                              KText(text:"Add shortcut",color: Colors.white,),
                                         
                                        ),
                                      ]);
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ))
                            // theme(context),
                          ],
                        ),
                      ),
                    ],
                    onSelected: (item) => selectedItem(context, item),
                  ),
                ),
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
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 50,
                width: size.width * 0.70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Send Messege",
                    hintStyle: TextStyle(
                      color: HexColor('#5BB509'),
                    ),
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
                child: Center(
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Theme theme(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        cardColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      child: ListTileTheme(
        iconColor: Colors.white,
        child: PopupMenuButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          ),
          color: HexColor('#5BB509'),
          itemBuilder: (context) => [
            PopupMenuItem(
                value: 0,
                child: KText(
                  text: 'Group info',
                  color: Colors.white,
                )),
            PopupMenuItem(
                value: 1,
                child: KText(
                  text: 'Search',
                  color: Colors.white,
                )),
            PopupMenuItem(
                value: 2,
                child: KText(
                  text: 'Mute notifications',
                  color: Colors.white,
                )),
            PopupMenuItem(
              value: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KText(
                    text: 'More',
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
          onSelected: (item) => selectedItem(context, item),
        ),
      ),
    );
  }

  selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        print('object');

        break;
      case 1:
        print('object');

        break;
      case 2:
        print('object');

        break;
      case 3:
        print('object');
        break;
    }
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int x) {
            return GestureDetector(
              onTap: () async {
                showMenu(
                  position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
                  context: context,
                  items: <PopupMenuEntry>[
                    PopupMenuItem(
                      value: x,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.delete),
                          Text("Delete"),
                        ],
                      ),
                    )
                  ],
                ).then((value) {
                  print(value);
                  showMenu(
                    position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
                    context: context,
                    items: <PopupMenuEntry>[
                      PopupMenuItem(
                        value: x,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.delete),
                            Text("Delete"),
                          ],
                        ),
                      )
                    ],
                  );
                });
              },
              child: ListTile(title: Text(x.toString())),
            );
          }),
    );
  }
}
