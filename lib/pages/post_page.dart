import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostPage extends StatelessWidget {
  PostPage({super.key, required this.uid});

  final uid;

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: messageController,
              decoration: InputDecoration(
                labelText: 'Body',
              ),
            ),
            ElevatedButton(
              child: Text('Post'),
              onPressed: () async {
                CollectionReference posts = FirebaseFirestore.instance.collection('posts');
                await posts.add({
                  'user': uid,
                  'body': messageController.text,
                  'timestamp': FieldValue.serverTimestamp(),
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
