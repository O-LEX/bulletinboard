import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  MessagesPage({super.key});
  final FirebaseFirestore db = FirebaseFirestore.instance;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          
        ),
      ],
    );
  }
}