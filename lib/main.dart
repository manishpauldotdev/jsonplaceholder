import 'package:flutter/material.dart';
import 'package:jsonplaceholder/screens/posts.dart';
import 'package:provider/provider.dart';

import 'package:jsonplaceholder/providers/post_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => PostsProvider())),
      ],
      child: MaterialApp(
        title: 'Json Data Handling',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const PostsScreen(),
      ),
    );
  }
}
