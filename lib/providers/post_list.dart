import 'package:flutter/material.dart';
import 'package:jsonplaceholder/services/fetch_posts.dart';
import 'package:jsonplaceholder/services/fetch_users.dart';

class PostsProvider extends ChangeNotifier {
  List<dynamic> _postListWithAuthor = [];

  List<dynamic> get postListWithAuthor => _postListWithAuthor;

  Future<void> fetchAllPosts() async {
    final posts = await fetchPosts();
    final users = await fetchUsers();

    _postListWithAuthor = posts.map((post) {
      final userId = post['userId'];
      final user = users.firstWhere((user) => user['id'] == userId);

      final Map<String, dynamic> postWithAuthor = {
        ...post,
        'authorName': user['name'],
      };

      return postWithAuthor;
    }).toList();

    notifyListeners();
  }
}
