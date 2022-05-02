

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:covid19_app/screens/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

//splashScreen
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds:4),()=>
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>myHomePage())),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      //child: Image.network("https://www.godan.info/sites/default/files/styles/partner_results_page_logo/public/news-media/Covid%2019%20%282%29.PNG?itok=uHYXSzsN"),
      child: Image.asset("image/splashscreen.png"),
    );
  }
}








