import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netzero/pages/home_page.dart';
import 'package:netzero/pages/webview.dart';
import 'package:netzero/util/color_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';




class SplashScreen extends StatefulWidget{

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()  {

    super.initState();
      pageNavigation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: buttonColor,
      body: SvgPicture.asset(
        "images/splash.svg",
        fit: BoxFit.cover,
      ),
    );
  }

  Future<void> pageNavigation() async {
    final sph = await SharedPreferences.getInstance();
    if(sph.getString("is_success")=="success"){
      Timer(const Duration(seconds: 3),
              ()=>Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) =>
                 WebviewScreen(url:sph.getString("url").toString())
                 // WebViewScreen()
              )
          )
      );
    }
    else {
      Timer(const Duration(seconds: 3),
              () =>
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                      (context) =>
                      LandingPage(title: 'title')
                  )
              )
      );
    }
  }
}


