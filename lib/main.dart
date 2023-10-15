import 'package:flutter/material.dart';
import 'package:jsonplaceholder/services/fetch_posts.dart';

void main() async {
  await fetchPosts();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json Data Handling',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Scaffold(),
    );
  }
}
