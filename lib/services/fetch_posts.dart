import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:jsonplaceholder/constants/apis.dart';

Future<List<dynamic>> fetchPosts() async {
  const url = Apis.postsApi;

  final uri = Uri.parse(url);

  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    }
  } catch (e) {
    e.toString();
  }

  return [];
}
