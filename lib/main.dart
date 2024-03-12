import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/messages_page.dart';
import 'pages/post_page.dart';
import 'pages/search_page.dart';
import 'pages/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
      ),
      home: StreamBuilder<User?>(
        stream: _auth.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // loading widget
          } else {
            if (snapshot.hasData) {
              final uid = snapshot.data!.uid;
              return AppPage(uid: uid);
            } else {
              return LoginPage();
            } // LoginPage()
          }
        },
      ),
    );
  }
}

class AppPage extends StatelessWidget {
  AppPage({super.key, required this.uid});

  final uid;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          key: ValueKey('MainPage'),
          child: MainPage(uid: uid),
        ),
      ],
      onPopPage: (route, result) => route.didPop(result),
    );     
  }
}

class MainPage extends StatefulWidget {
  MainPage({super.key, required this.uid});
  
  final uid;

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  late String username;
  bool isLoading = true; // Flag to indicate data loading state

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      if (doc.exists) {
        setState(() {
          username = doc.get('username');
          isLoading = false;
        });
      } else {
        // Handle the case where the user document doesn't exist
        print('User document does not exist for uid: ${widget.uid}');
      }
    } catch (error) {
      // Handle errors during data fetching
      print('Error fetching user data: $error');
    }
  }

  int _selectedIndex = 0;

  static List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    MessagesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      drawer: isLoading ?  CircularProgressIndicator() : MainDrawer(uid: widget.uid, username: username),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return PostPage(uid: widget.uid);
              }
            )
          );
        },
        child: Icon(Icons.add),
      )
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.uid, required this.username});

  final uid;
  final username;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
             username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "sample@mail",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: FlutterLogo(),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProfilePage(uid: uid);
                  }
                )
              );
            },
          ),
          ListTile(
            title: const Text('Sign out'),
            onTap: () async {
              final FirebaseAuth _auth = FirebaseAuth.instance;
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
