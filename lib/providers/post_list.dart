import 'package:flutter/material.dart';
import 'package:jsonplaceholder/services/fetch_posts.dart';

class PostsProvider extends ChangeNotifier {
  List<dynamic> _postList = [];

  List<dynamic> get postList => _postList;

  Future<void> fetchAllPosts() async {
    final response = await fetchPosts();

    _postList = response;

    notifyListeners();
  }
}
