import 'package:flutter/material.dart';
import 'bookModel.dart';
import 'book_data_source.dart';
import 'detailBuku.dart';
import 'infoUser.dart';

class HomePage extends StatelessWidget {
  final String name;
  final String username;
  final String password;

  HomePage(
      {required this.name, required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Buku'),
        backgroundColor: Color.fromARGB(255, 143, 98, 54),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoUser(
                    name: name,
                    username: username,
                    password: password,
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: Colors.brown[100],
      body: WillPopScope(
        onWillPop: () async {
          // Menampilkan dialog konfirmasi sebelum kembali ke halaman login
          bool confirmExit = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Konfirmasi'),
              content: Text('Apakah Anda ingin keluar dari aplikasi?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('Tidak'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Ya'),
                ),
              ],
            ),
          );

          // Mengembalikan nilai true jika pengguna memilih untuk keluar dari aplikasi
          return confirmExit ?? false;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selamat datang, $name'),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                future: BookDataSource.instance.loadBook(),
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    var bookList = BukuModel.fromJson(snapshot.data!);
                    return ListView.builder(
                      itemCount: bookList.items!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var book = bookList.items![index];
                        return ListTile(
                          onTap: () {
                            // Navigasi ke halaman DetailBuku saat item diklik
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailBuku(book: book),
                              ),
                            );
                          },
                          // leading: book.volumeInfo!.imageLinks != null
                          //     ? Padding(
                          //         padding: EdgeInsets.all(
                          //             8.0), // Tambahkan jarak 8.0 pada semua sisi
                          //         child: Image.network(
                          //           book.volumeInfo!.imageLinks!.thumbnail!,
                          //           width: 50,
                          //           height: 50,
                          //           fit: BoxFit.cover,
                          //         ),
                          //       )
                          //     : SizedBox.shrink(),
                          title: Text(
                            book.volumeInfo!.title ?? 'Unknown Title',
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(
                            book.volumeInfo!.authors?.join(', ') ??
                                'Unknown Author',
                            style: TextStyle(fontSize: 14),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
