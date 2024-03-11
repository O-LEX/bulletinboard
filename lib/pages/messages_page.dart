import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  MessagesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          key: ValueKey('MainPage'),
          child: MainPage(),
        ),
      ],
      onPopPage: (route, result) => route.didPop(result),
    );
  }
}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Search',
            ),
          ),
          ElevatedButton(
            child: Text('Search'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchResultsPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SearchResultsPage extends StatelessWidget {
  SearchResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Search Results'),
        ),
      ],
    );
  }
}
