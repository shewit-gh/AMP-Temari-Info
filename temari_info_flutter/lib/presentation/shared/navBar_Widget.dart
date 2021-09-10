import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/universities/universities.dart';

Widget drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text("user name", style: TextStyle(fontSize: 16)),
            )),
        ListTile(
          //tileColor: Color.fromRGBO(211, 211, 211, 0.8),
          leading: Icon(Icons.info),
          title: const Text('About us'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.school),
          title: const Text('Universities'),
          onTap: () {
            
            // Update the state of the app
            Navigator.pushNamed(
              context,
              Universities.routeName
              
            );
            
            
          },
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: const Text('Profile'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.help_outline),
          title: const Text('contact'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: const Text('Log out'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}



Widget navtop() {
  return AppBar(
    backgroundColor: Colors.black12,
    //leading: Icon(Icons.menu),
    title: Text(
      'ተማሪ info',
      style: TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      // Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 16),
      //   child: Icon(Icons.search),
      // ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.more_vert),
      ),
    ],
  );
}


Widget bottomnav() {
  return BottomNavigationBar(
    backgroundColor: Colors.black12,
    selectedItemColor: Colors.teal,
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
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ],
  );
}
