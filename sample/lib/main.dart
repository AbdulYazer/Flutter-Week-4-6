import 'package:flutter/material.dart';

main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      home : HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  String name = 'FLUTTER DEVELOPER';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 121, 112),
      //appBar: AppBar(),
      body:  SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                      print('Text Button Clicked');
                      }, child: Text('Click Me')
                    ),
                    ElevatedButton(
                      onPressed: (){},
                      child: Text('Click Me')
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex:2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black,width: 5,),
                ),
                child: Center(child: Text('DART SDE')),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                      print('Text Button Clicked');
                      }, child: Text('Click Me')
                    ),
                    ElevatedButton(
                      onPressed: (){},
                      child: Text('Click Me')
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}