import 'package:flutter/material.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';

class TagsExplorer extends StatefulWidget {
  const TagsExplorer({Key? key});

  @override
  State<TagsExplorer> createState() => _TagsExplorerState();
}

class _TagsExplorerState extends State<TagsExplorer> {
  String _searchText = '';
  List<String> _searchResults = [];

  void _onSearchTextChanged(String searchText) async {
    final searchResults =
        await UserRepository.instance.getSearchResults(searchText);

    setState(() {
      _searchText = searchText;
      _searchResults = searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Tags Explorer"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search tags',
                border: OutlineInputBorder(),
              ),
              onChanged: _onSearchTextChanged,
            ),
          ),
          if (_searchText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Search results for "${_searchText}":',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_searchResults[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
