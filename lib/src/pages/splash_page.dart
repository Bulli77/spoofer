import 'package:chat_u/src/config/ktext.dart';
import 'package:chat_u/src/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
    @override
  void initState() {
    super.initState();
    _navigatetowelcomePage();
  }

  _navigatetowelcomePage() async {
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
  }
  @override
  Widget build(BuildContext context) {
    final Size size =Get.size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/logo.png')),
          SizedBox(height: size.height*0.05,),
          KText(
            text: 'I Chat U',
            fontSize: 30,
            color: HexColor('#5BB509'),
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
