import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text("E-LEARNING UPNYK",
              style: 
                TextStyle(
                fontSize: 30,
              ),
            ),
            usernameField(),
            passwordField(),
            loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: (isLoginSuccess) ? Colors.blue : Colors.black, // background
          foregroundColor: Colors.white, // foreground
        ),
        onPressed: () {

          String text = "";
          if (username == "Shofia Atika" && password == "123") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(
              context, MaterialPageRoute(
                builder: (context) {
                  return HomePage(Username: username);
                }
              ) 
            );
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }

          print("isLoginSuccess : $isLoginSuccess");

          SnackBar snackBar = SnackBar(
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Masuk'),
      ),
    );
  }
}