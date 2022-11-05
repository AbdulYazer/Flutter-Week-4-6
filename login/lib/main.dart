import 'package:flutter/material.dart';
import 'package:login/screens/splash.dart';


const SAVE_KEY_NAME = 'UserLoggedIn';

main() async {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Sample',
      theme: ThemeData(
        // primarySwatch: Colors.lightBlue,
      ),
      home:const ScreenSplash(),
    );
  }
}
