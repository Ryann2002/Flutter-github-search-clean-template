import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_git_search/presenters/blocs/search_bloc.dart';
import 'package:get_it/get_it.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _getit = GetIt.I;

  @override
  Widget build(BuildContext context) {
    final bloc = _getit.get<SearchBloc>();
    return Scaffold(
        appBar: AppBar(title: const Text("Search Page")),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  bloc.add(Search(value));
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Search..."),
              ),
            ),
            Expanded(
              child: BlocBuilder(
                  bloc: bloc, // provide the local bloc instance
                  builder: (context, SearchState state) {
                    if (state is SearchIdle) {
                      return const Center(
                        child: Text("Digite um algo"),
                      );
                    }

                    if (state is SearchOnError) {
                      return const Center(
                        child: Text("Ocorreu um erro"),
                      );
                    }

                    if (state is SearchLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final list = (state as SearchSucess).list;
                    return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (_, id) {
                          final item = list[id];
                          return ListTile(
                              title: Text(item.title ?? ""),
                              leading: CircleAvatar(
                                backgroundImage: item.img == null
                                    ? null
                                    : NetworkImage(item.img ?? ""),
                              ),
                              subtitle: Text(item.content ?? ""));
                        });
                  }),
            ),
          ],
        ));
  }
}
