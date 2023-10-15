import 'package:flutter/material.dart';
import 'package:jsonplaceholder/providers/post_list.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postsProvider = Provider.of<PostsProvider>(
      context,
      listen: false,
    );
    postsProvider.fetchAllPosts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: Consumer<PostsProvider>(
        builder: ((context, posts, child) {
          return posts.postList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: posts.postList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${posts.postList[index]['title']}',
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const Divider(),
                              Text(
                                'Author: ${posts.postList[index]['userId'].toString()}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
        }),
      ),
    );
  }
}
