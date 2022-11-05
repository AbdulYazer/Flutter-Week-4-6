import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:login/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ScreenLogin extends StatefulWidget {
const  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 const  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                    Padding(
                    padding:const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _usernameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration:const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        hintText: 'Enter Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value){
                        //return _isDataMatched?null:'Error';
                        return value==null || value.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)?'Email not valid':null;
                      } ,
                    ),
                    ),
                    Padding(
                     padding:const EdgeInsets.symmetric(vertical: 10),
                     child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      controller: _passwordController,
                      //keyboardType: TextInputType.visiblePassword,
                      decoration:const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        hintText: 'Enter Password',
                        prefixIcon: Icon(Icons.password),
                      ),
                      validator: (value){
                        //return _isDataMatched?null:'Error';
                        return value==null||value.isEmpty || !RegExp(r'^[\w]{4,8}').hasMatch(value)?'Enter correct password':null;
                      } ,
                    ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: !_isDataMatched,
                        child:const Text(
                          'Username or Password doesnot match',
                          style: TextStyle(
                            color: Colors.red
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          (_formKey.currentState!.validate())?checkLogin(context):'Data empty';
                          //checkLogin(context);
                        }, 
                        child:const Text('Login'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }

  void checkLogin(BuildContext ctx) async{
    final _email = 'yazer8353@gmail.com';
    final _pass = '12345';
    final _username =_usernameController.text;
    final _password = _passwordController.text;
    if((_username == _email) && (_password == _pass) ){
      //Goto Homepage

      final _sharedPrefs =await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME,true);

      Navigator.of(ctx ).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {

      print('Username or Password doesnot match');
      // showDialog(
      //   context: ctx, 
      //   builder: (ctx1){
      //     return AlertDialog(
      //       title: Text('Error'),
      //       content: Text('Username and Password doesnot match'),
      //       actions: [
      //         TextButton(
      //           onPressed: (){
      //             Navigator.of(ctx1 ).pop();
      //           }, 
      //           child: Text('Cancel'),
      //         ),
      //         TextButton(
      //           onPressed: (){
      //             Navigator.of(ctx1 ).pop();
      //           }, 
      //           child: Text('Retry'),
      //         ),
      //       ],
      //     );
      //   }
      // );
      //final _errorMessage = 'Username and Password doesnot match';
      

      //Show Text
      setState(() {
        _isDataMatched = false;
      });

    }
  }
}
