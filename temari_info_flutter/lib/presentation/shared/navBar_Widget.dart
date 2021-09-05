import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _BasicBottomNavBarState createState() => _BasicBottomNavBarState();
}

class _BasicBottomNavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: Icon(Icons.menu),
        title: Text(
          'ተማሪ info',
          style: TextStyle(
            color: Colors.teal,
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
      ),
      body: Center(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black12,
        selectedItemColor: Color.fromRGBO(118, 219, 224, 1),
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget navtop() {
  return AppBar(
    backgroundColor: Colors.black12,
    leading: Icon(Icons.menu),
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
