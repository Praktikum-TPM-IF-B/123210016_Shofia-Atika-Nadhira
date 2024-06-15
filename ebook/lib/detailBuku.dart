import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'bookModel.dart'; // Import kelas BookModel

class DetailBuku extends StatefulWidget {
  final Items book;

  DetailBuku({required this.book});

  @override
  _DetailBukuState createState() => _DetailBukuState();
}

class _DetailBukuState extends State<DetailBuku> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buku Info',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 143, 98, 54),
      ),
      backgroundColor: Colors.brown[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Judul : ${widget.book.volumeInfo?.title ?? 'Unknown Title'}',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 10),
            Text(
              'Penulis : ${widget.book.volumeInfo?.authors?.join(', ') ?? 'Unknown Author'}',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 10),
            Text(
              'Penerbit : ${widget.book.volumeInfo?.publisher ?? 'Unknown'}',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 10),
            Text(
              'Tahun Terbit : ${widget.book.volumeInfo?.publishedDate ?? 'Unknown'}',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 10),
            Text(
              'Jumlah Halaman : ${widget.book.volumeInfo?.pageCount ?? 'Unknown'}',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Fungsi untuk membuka tautan pratinjau buku
                _launchPreview(widget.book.volumeInfo?.previewLink);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFF654321)), 
                foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text('Baca Buku', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuka tautan pratinjau buku
  void _launchPreview(String? url) async {
    if (url != null && await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tautan pratinjau tidak tersedia'),
        ),
      );
    }
  }
}
