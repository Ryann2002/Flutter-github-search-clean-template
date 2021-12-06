import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Page")),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Search..."),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (_, id) {
              return const ListTile();
            }),
          ),
        ],
      ),
    );
  }
}
