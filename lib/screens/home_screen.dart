import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'add_screen.dart';
import 'search_screen.dart';
import 'report_screen.dart';
import 'edit_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/widgets/mainIcons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  FirebaseUser loggedInUser;

  void getUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Home'),
        leading: Container(),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                children: <Widget>[Icon(Icons.lock), Text('Logout')],
              ),
            ),
          ),
        ],
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 6,
        padding: EdgeInsets.all(8),
        staggeredTiles: [
          StaggeredTile.count(4, 2),
          StaggeredTile.count(2, 2),
          StaggeredTile.count(2, 2),
          StaggeredTile.count(2, 2),
          StaggeredTile.count(2, 2),
        ],
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/SU.png',
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Welcome UserX',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          CustomIconButton(
            iconType: Icons.search,
            textTitle: 'Search',
            onpress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SearchScreen()));
            },
          ),
          CustomIconButton(
            iconType: Icons.edit,
            textTitle: 'Edit',
            onpress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => EditScreen()));
            },
          ),
          CustomIconButton(
            iconType: Icons.library_books,
            textTitle: 'Reports',
            onpress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ReportsScreen()));
            },
          ),
          CustomIconButton(
            iconType: Icons.assignment_turned_in,
            textTitle: 'Issue Laptop',
            onpress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => IssueLaptop()));
            },
          ),
        ],
      ),
    );
  }
}
