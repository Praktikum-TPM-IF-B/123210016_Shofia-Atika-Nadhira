import 'package:flutter/material.dart';
import 'post_model.dart';
import 'post_data_source.dart';
import 'detail_post_page.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late Future<List<PostModel>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = PostDataSource.instance.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
          const Text("Postingan",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold, 
              letterSpacing: 1,
              fontFamily: "Circular", 
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder<List<PostModel>>(
            future: futurePosts,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return _buildErrorSection();
              } 
              
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final post = snapshot.data![index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPostPage(posts: post),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Username : ${post.user?.username}"),
                          Text("Name : ${post.user?.name}"),
                          Text("Title : ${post.title}"),
                          Text("Body : "),
                          Text(post.body ?? ""),
                          const SizedBox(
                            height: 10,
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
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}