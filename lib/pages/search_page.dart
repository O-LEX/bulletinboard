import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter your search term',
          ),
        ),
        SizedBox(height: 20),
      ]
    );
  }
}