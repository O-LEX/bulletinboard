import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Enter your search term',
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 200,
          color: Colors.grey,
        )
      ]
    );
  }
}