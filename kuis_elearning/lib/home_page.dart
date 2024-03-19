import 'package:flutter/material.dart';
import 'login_page.dart';
import 'DummyMahasiswa.dart';
import 'detail_page.dart';


class HomePage extends StatefulWidget {
  final String Username;

  const HomePage({Key? Key, required this.Username}) : super(key:key);

  @override 
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override 
  Widget build(BuildContext context){ 
    return Scaffold( 
      appBar: AppBar(
        title: Text("HI, ${widget.Username}"),
      ),
      body: Container( 
        child: Text(
          "Data Teman",
          style: 
            TextStyle(
            fontSize: 12,
          ),
        child: Padding( 
          padding: const EdgeInsets.all(15.0),
          child: Text(
            '', 
          style: TextStyle(fontSize: 14)),
        ),
        child: _buildDaftarMahasiswa(context),
        ),
      ),
    );
  }
}

Widget _buildDaftarMahasiswa(BuildContext context, namaMahasiswa mahasiswa){
  return InkWell(
    onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(mahasiswa: mahasiswa),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 8.0),
            Text(
              mahasiswa.nama,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Center text horizontally
            ),
            Text(
              mahasiswa.nim,
              style: TextStyle(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.center, // Center text horizontally
            ),
          ],
        ),
      ),
  ); 
}