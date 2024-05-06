import 'package:flutter/material.dart';
import 'post_model.dart';
import 'comments_model.dart';
import 'post_data_source.dart';

class DetailPostPage extends StatefulWidget {
  final PostModel posts;

  const DetailPostPage({Key? key, required this.posts}) : super(key: key);

  @override
  _DetailPostPageState createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> {
  late Future<List<CommentsModel>> futureComments;

  @override
  void initState() {
    super.initState();
    futureComments =
        PostDataSource.instance.loadComments(widget.posts.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Page",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Circular',
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Username : ${widget.posts.user?.username}"),
              Text("Title : ${widget.posts.title}"),
              const SizedBox(height: 20),
              Text("Body : ${widget.posts.body}"),
              Text("Comments : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: "Circular"
                ),
              ),
              Expanded(
                child: FutureBuilder<List<CommentsModel>>(
                  future: futureComments,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return _buildErrorSection();
                    } 
                    
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return _buildEmptySection();
                      }

                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final comment = snapshot.data![index];
                          return ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name : ${comment.name}",
                                  style: TextStyle(
                                    fontSize: 14),
                                  ),
                                Text(
                                  "Email : ${comment.email}",
                                  style: TextStyle(
                                    fontSize: 14),
                                  ),
                                Text(
                                  "Body : ",
                                  style: TextStyle(
                                    fontSize: 14)
                                ),
                                Text(
                                  comment.body ?? '',
                                  style: TextStyle(
                                    fontSize: 14)
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } 
                    return _buildLoadingSection();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Tidak ada comment");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
