import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:jsonplaceholder/constants/apis.dart';

Future<List<dynamic>> fetchUsers() async {
  const url = Apis.usersApi;

  final uri = Uri.parse(url);

  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print('users $json');
      return json;
    }
  } catch (e) {
    throw e.toString();
  }

  return [];
}
