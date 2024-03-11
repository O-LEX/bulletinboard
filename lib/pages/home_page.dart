import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
  MainPage({super.key});

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: db.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong: ${snapshot.error}'); // Provide more details
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // Use a visual indicator
        }

        final documents = snapshot.data!.docs; // Avoid unnecessary nesting
        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final document = documents[index];
            if (!document.exists) {
              return const Text('Document not found'); // Handle missing documents
            }

            final data = document.data() as Map<String, dynamic>; // Type safety
            final body = data['body'];
            if (body == null) {
              return const Text('Missing "body" field'); // Handle missing field
            }

            return ListTile(
              title: Text(body),
            );
          }
        );
      }
    );
  }
}
