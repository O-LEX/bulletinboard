import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
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
              onPressed: () {
                // Save the username
                print('Username: ${_usernameController.text}');
              },
            ),
          ],
        ),
      ),
    );
  }
}