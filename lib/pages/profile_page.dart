import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key, required this.uid});
  
  final uid;

  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () async {
                await FirebaseFirestore.instance.collection('users').doc(uid).update({
                  'username': _usernameController.text,
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