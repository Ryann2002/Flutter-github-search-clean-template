import 'package:flutter/material.dart';
import 'package:flutter_git_search/presenters/pages/search_page.dart';
import "injection_container.dart" as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const SearchPage(),
    );
  }
}
