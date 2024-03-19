import 'package:flutter/material.dart';
import 'DummyMahasiswa.dart'; 
import 'home_page.dart';

class DetailPage extends StatefulWidget {
  final Mahasiswa mahasiswa;

  DetailPage({required this.mahasiswa});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Teman"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            tag: widget.mahasiswa.nim,
            SizedBox(height: 8),
            Text(
              widget.mahasiswa.nama,
            ),
            SizedBox(height: 8),
            Text(
              widget.mahasiswa.nim as String,
            ),
            SizedBox(height: 8),
            Text(
              widget.mahasiswa.ipk as String,
            ),
            SizedBox(height: 8),
            Text(
              widget.mahasiswa.tahunMasuk as String,
            ),
            SizedBox(height: 8),
            Text(
              widget.mahasiswa.totalSKS as String,
            ),
            SizedBox(height: 8),
            Text(
              widget.mahasiswa.semesterSaatIni as String,
            ),
          ],
        ),
      ),
    );
  }
}
