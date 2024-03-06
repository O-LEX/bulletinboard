import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Hello, world!'),
          subtitle: Text('Welcome to the Bulletin Board!'),
        ),
        Container(
          height: 20,
          child: ElevatedButton(
            onPressed: () {
              db.collection('messages').add({
                'text': 'Hello, world!',
                'timestamp': DateTime.now(),
              });
            },
            child: Text('Post a message'),
          ),
        ),
      ],
    );
  }
}
