import 'base_network.dart';

class BookDataSource {
  static BookDataSource instance = BookDataSource();

  Future<Map<String, dynamic>> loadBook() {
    return BaseNetwork.get("volumes?q=Fiction&maxResults=40");
  }
}
