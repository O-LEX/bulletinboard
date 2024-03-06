import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Messages', style: TextStyle(fontSize: 32.0)),
    );
  }
}