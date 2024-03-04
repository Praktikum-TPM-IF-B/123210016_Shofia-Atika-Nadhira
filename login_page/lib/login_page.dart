import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Form")
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            usernameField(),
            passwordField(),
            loginButton(context),
          ]
        ),
        ),
      );
    }
}

Widget usernameField(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextFormField(
      enabled: true,
      decoration: const InputDecoration(
        hintText: 'Username',
        contentPadding: const EdgeInsets.all(8.0),
        border: OutlineInputBorder( 
          borderRadius: BorderRadius.all(Radius.circular(8.0)), 
          borderSide: BorderSide(color: Colors.blue)
        ),
      ), 
    ), 
  ); 
}

Widget passwordField(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextFormField(
      enabled: true,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Password',
        contentPadding: const EdgeInsets.all(8.0),
        border: OutlineInputBorder( 
          borderRadius: BorderRadius.all(Radius.circular(8.0)), 
          borderSide: BorderSide(color: Colors.blue)
        ),
      ), 
    ), 
  ); 
}

Widget loginButton(BuildContext context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    width: MediaQuery.of(context).size.width,
    child: ElevatedButton( 
      onPressed: () {},
      child: const Text('Login')
    )
  ); 
}

