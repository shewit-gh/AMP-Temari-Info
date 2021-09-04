import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/admin/admin_screen.dart';
import 'package:temari_info_flutter/presentation/home/home_screen.dart';
import 'package:temari_info_flutter/presentation/institute/institute_screen.dart';
import 'package:temari_info_flutter/presentation/login/login_screen.dart';
import 'package:temari_info_flutter/presentation/report/report_screen.dart';
import 'package:temari_info_flutter/presentation/search/search_screen.dart';
import 'package:temari_info_flutter/presentation/signup/signup_scrren.dart';
import 'package:temari_info_flutter/presentation/univ_admin/univ_admin_screen.dart';
import 'package:temari_info_flutter/presentation/university/university_screen.dart';
import 'package:temari_info_flutter/presentation/user/user_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Temari Info',
        theme: ThemeData(
          // primarySwatch: Colors.blue,
          primarySwatch: Colors.teal,
          brightness: Brightness.dark,
        ),
        initialRoute: Home.routeName,
        routes: {
          University.routeName: (BuildContext context) => University(),
          Institute.routeName: (BuildContext context) => Institute(),
          Home.routeName: (BuildContext context) => Home(),
          Admin.routeName: (BuildContext context) => Admin(),
          Login.routeName: (BuildContext context) => Login(),
          Signup.routeName: (BuildContext context) => Signup(),
          UnivAdmin.routeName: (BuildContext context) => UnivAdmin(),
          User.routeName: (BuildContext context) => User(),
          Search.routeName: (BuildContext context) => Search(),
          Report.routeName: (BuildContext context) => Report(),
        });
  }
}
