import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  PostPage({super.key});

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
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
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
              onPressed: () {
              
              },
            ),
          ],
        ),
      ),
    );
  }
}
