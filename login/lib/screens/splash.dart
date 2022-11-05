import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:login/screens/home.dart';
import 'package:login/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {

  @override
  void initState() {
    //gotoLogin();
    checkUserLoggedIn(); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.cyanAccent,
    );
  }


  gotoLogin() async{ 
    Timer(
      const Duration(seconds: 3),
      (() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
             builder: (context)=> const ScreenLogin()
          ),
        );
      })
    );
  }

  Future<void> checkUserLoggedIn() async{
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);
    if(_userLoggedIn == null || _userLoggedIn == false){
      gotoLogin(); 
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}