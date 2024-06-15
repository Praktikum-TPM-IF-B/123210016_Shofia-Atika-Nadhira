import 'package:flutter/material.dart';

class InfoUser extends StatefulWidget {
  final String name;
  final String username;
  final String password;

  InfoUser({required this.name, required this.username, required this.password});

  @override
  _InfoUserState createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Akun',
        style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 143, 98, 54),
      ),
      backgroundColor: Colors.brown[100],
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name : ${widget.name}', style: TextStyle(fontSize: 14)),
            SizedBox(height: 10),
            Text('Username : ${widget.username}', style: TextStyle(fontSize: 14)),
            // SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Password : ${_isPasswordVisible ? widget.password : '•' * widget.password.length}',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
