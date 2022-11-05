import 'package:flutter/material.dart';
import 'package:login/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('HOME'),
        actions: [
          IconButton(onPressed: (){
            signout(context);
          }, 
          icon:const Icon(Icons.exit_to_app)),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx,index){
            if(index%2 == 0){
              return oddTile(index);
            }
            else{
              return evenTile(index);
            }
            
          } , 
          separatorBuilder: (ctx,index){
            return const Divider();
          }, 
          itemCount:20,
        ),
      ),
    
  );
  }



  ListTile oddTile(int index) {
    return ListTile(
            title: Text('Cat $index',),
            leading:const  CircleAvatar(
              backgroundImage:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRayBko6Fh0dBJFOKGKGSDDuH6QeW1RrEKI3-qkTU_Y&s'),
              radius: 30,
            ),
          );
  }
  ListTile evenTile(int index) {
    return ListTile(
            title: Text('Cat $index'),
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Image.asset('assets/images/cat2.jpeg'),
            )
          );
  }

  signout(BuildContext ctx){

    

    showDialog(
      context: ctx, 
      builder: (ctx1){
        return AlertDialog(
          title:const Text('Are you sure you want to logout'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(ctx1).pop();
              }, 
              child:const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () async{
                Navigator.of(ctx1).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1) => ScreenLogin()),(route) => false);
                final _sharedPrefs =await SharedPreferences.getInstance();
                  await _sharedPrefs.clear();
              }, 
              child:const Text('OK'),
            ),
          ],
        );
      }
      );

    //Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false); 
  }
  

}