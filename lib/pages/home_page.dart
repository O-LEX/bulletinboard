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
          child: button0(db: db),
        ),
      ],
    );
  }
}

class button0 extends StatelessWidget {
  const button0({
    super.key,
    required this.db,
  });

  final FirebaseFirestore db;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Tap'),
      onPressed: function
    );
  }

  void function() {

    final docRef = db.collection("cities").doc("SF");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );

  }
}
