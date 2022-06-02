import 'package:chat_u/src/config/ktext.dart';
import 'package:chat_u/src/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.12,
          ),
          Center(
              child: Image.asset(
            'assets/logo.png',
            width: 130,
          )),
          SizedBox(
            height: 10,
          ),
          KText(
            text: 'Welcome Back',
            fontSize: 30,
            color: HexColor('#5BB509'),
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 10,
          ),
          KText(
            text: 'Login to your account',
            color: HexColor('#5BB509'),
            fontSize: 12,
          ),
          Container(
            alignment: Alignment.center,
            margin:
                EdgeInsets.only(left: 20, right: 20, top: size.height * 0.15),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: HexColor('#5BB509'),
                ),
                hintText: "Email/User Id",
                hintStyle: TextStyle(color: Colors.black54),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: HexColor('#5BB509'),
                ),
                hintText: "Email/User Id",
                hintStyle: TextStyle(color: Colors.black54),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(50),
            splashColor: Colors.black26,
            onTap: () {
              Get.offAll(ChatPage());
            },
            child: Container(
              height: 50,
              width: size.width * 0.90,
              decoration: BoxDecoration(
                color: HexColor('#5BB509'),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KText(
                    text: 'Sign In',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.east_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.15,
          ),
          KText(
            text: 'brought to you by ISEEU',
            color: HexColor('#5BB509'),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )
        ],
      ),
    );
  }
}
