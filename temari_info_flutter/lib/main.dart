import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:temari_info_flutter/presentation/add_department/add_department_screen.dart';
import 'package:temari_info_flutter/presentation/add_inst/add_inst_screen.dart';
import 'package:temari_info_flutter/presentation/admin/admin_screen.dart';
import 'package:temari_info_flutter/presentation/contact/contact_screen.dart';
import 'package:temari_info_flutter/presentation/home/home_screen.dart';
import 'package:temari_info_flutter/presentation/institute/institute_screen.dart';
import 'package:temari_info_flutter/presentation/login/login_screen.dart';
import 'package:temari_info_flutter/presentation/report/report_screen.dart';
import 'package:temari_info_flutter/presentation/search/search_screen.dart';
import 'package:temari_info_flutter/presentation/signup/signup_screen.dart';
import 'package:temari_info_flutter/presentation/univ_admin/edit_inst_screen.dart';
import 'package:temari_info_flutter/presentation/univ_admin/edit_univ_screen.dart';
import 'package:temari_info_flutter/presentation/university/university_screen.dart';
import 'package:temari_info_flutter/presentation/user/user_screen.dart';
import 'package:temari_info_flutter/presentation/about/about_us.dart';
import 'package:temari_info_flutter/presentation/user/edit_profile_screen.dart';
import 'package:temari_info_flutter/presentation/login/forgot_password_screen.dart';
import 'package:temari_info_flutter/presentation/login/reset_password_screen.dart';
import 'package:temari_info_flutter/presentation/login/set_new_password_screen.dart';
import 'package:temari_info_flutter/presentation/universities/universities.dart';
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
        initialRoute: Universities.routeName,
        routes: {
          University.routeName: (BuildContext context) => University(),
          Institute.routeName: (BuildContext context) => Institute(),
          Home.routeName: (BuildContext context) => Home(),
          Admin.routeName: (BuildContext context) => Admin(),
          // Login.routeName: (BuildContext context) => Login(),
          Signup.routeName: (BuildContext context) => Signup(),
          EditUniv.routeName: (BuildContext context) => EditUniv(),
          EditInst.routeName: (BuildContext context) => EditInst(),
          User.routeName: (BuildContext context) => User(),
          Search.routeName: (BuildContext context) => Search(),
          Report.routeName: (BuildContext context) => Report(),
          AddDepartment.routeName: (BuildContext context) => AddDepartment(),
          AddInst.routeName: (BuildContext context) => AddInst(),
          Contact.routeName: (BuildContext context) => Contact(),
          About.routeName: (BuildContext context) => About(),
          // EditProfile.routeName: (BuildContext context) => EditProfile(),
          // ForgotPassword.routeName: (BuildContext context) => ForgotPassword(),
          ResetPassword.routeName: (BuildContext context) => ResetPassword(),
          // SetNewPassword.routeName: (BuildContext context) => SetNewPassword(),
          Universities.routeName: (BuildContext context) => Universities(),
          
        });
  }
}
