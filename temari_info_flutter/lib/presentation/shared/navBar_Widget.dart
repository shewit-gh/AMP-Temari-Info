import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/auth/bloc/auth_bloc.dart';
import 'package:temari_info_flutter/auth/bloc/auth_event.dart';
import 'package:temari_info_flutter/auth/bloc/auth_state.dart';
import 'package:temari_info_flutter/presentation/login/login_screen.dart';
import 'package:path/path.dart';
import 'package:temari_info_flutter/auth/models/auth_model.dart';
import 'package:temari_info_flutter/presentation/about/about_us.dart';
import 'package:temari_info_flutter/presentation/contact/contact_screen.dart';
import 'package:temari_info_flutter/presentation/home/home_screen.dart';
import 'package:temari_info_flutter/presentation/universities/universities.dart';
import 'package:temari_info_flutter/presentation/user/edit_profile_screen.dart';
import 'package:temari_info_flutter/presentation/user/user_screen.dart';

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
            Navigator.pushNamed(context, About.routeName);
          },
        ),
        ListTile(
          leading: Icon(Icons.school),
          title: const Text('Universities'),
          onTap: () {
            // Update the state of the app
            Navigator.pushNamed(context, Universities.routeName);
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

            Navigator.pushNamed(context, Userp.routeName);
          },
        ),
        ListTile(
          leading: Icon(Icons.help_outline),
          title: const Text('contact'),
          onTap: () {
            Navigator.pushNamed(context, Contact.routeName);
          },
        ),
        ListTile(
  
          leading: Icon(Icons.logout),
          title: const Text('Log out'),
          onTap: () {
            // Update the state of the app
            BlocConsumer<AuthBloc, AuthState>(
                listener: (ctx, authState) {},
                builder: (ctx, authState) {
                
                 final authBloc = BlocProvider.of<AuthBloc>(context);

                      authBloc.add(
                        SignOutEvent(),
                      );
                  return CircularProgressIndicator();
                },
              );
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



Widget bottomnav2() {
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

Widget bottomnav(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      // SizedBox(width: 5,),
      IconButton(
        onPressed: (){
          Navigator.pushNamed(context, Home.routeName);
        }, 
        icon:Icon(Icons.home, size: 30), ),
      SizedBox(width: 20,),
      IconButton(
        onPressed: (){
            Navigator.pushNamed(context, Home.routeName);
        }, 
        icon:Icon(Icons.search, size: 30), ),
      SizedBox(width: 20,),
      IconButton(
        onPressed: (){
            Navigator.pushNamed(context, Userp.routeName);
        }, 
        icon:Icon(Icons.person, size: 30), )

    ],
  );
}