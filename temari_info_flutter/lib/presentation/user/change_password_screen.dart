import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/presentation/admin/admin_univadd_screen.dart';
import 'package:temari_info_flutter/presentation/home/home_screen.dart';
import 'package:temari_info_flutter/presentation/login/login_screen.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';
import 'package:temari_info_flutter/auth/bloc/auth_bloc.dart';
import 'package:temari_info_flutter/auth/bloc/auth_event.dart';
import 'package:temari_info_flutter/auth/bloc/auth_state.dart';
import 'package:temari_info_flutter/auth/data_providers/auth_provider.dart';
// import 'package:temari_info_flutter/auth/models/auth_model.dart';
import 'package:temari_info_flutter/auth/repository/auth_repo.dart';
import 'package:http/http.dart' as http;
import 'package:temari_info_flutter/presentation/signup/signup_screen.dart';
import 'package:temari_info_flutter/presentation/univ_admin/edit_univ_screen.dart';
import 'package:temari_info_flutter/presentation/user/user_screen.dart';

class ChangePassword extends StatelessWidget {
  static const String routeName = "/ChangePassword";
ChangePassword({Key? key}) : super(key: key);

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final userameTextController = TextEditingController();
  final confirmpasswordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: navtop()),
      bottomNavigationBar:PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: bottomnav()),
      body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(height:50),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Change your password',
                      style: TextStyle(fontSize: 20),
                    )),
                
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    obscureText: true,
                    controller: passwordTextController,
                    decoration: InputDecoration(
                      suffixIcon: const Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: const Icon(Icons.visibility)),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),     
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    obscureText: true,
                    controller: confirmpasswordTextController,
                    decoration: InputDecoration(
                      suffixIcon: const Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: const Icon(Icons.visibility)),
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                    ),
                  ),
                ), BlocConsumer<AuthBloc, AuthState>(
                listener: (ctx, authState) {
                  if (authState is changePasswordSuccess) {
                    Navigator.of(context).pushNamed(User.routeName);
                  };
                  
                },
                builder: (ctx, authState) {
                  Widget buttonChild = Text("Change password");
                 
                  if (authState is changePasswordInProgress) {
                    buttonChild = SizedBox(
                  
                      child: Row(children:[CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      Text("Password change in progress")
                    ]));
                  }
  
                  if (authState is changePasswordFailed) {
                    buttonChild = Text(authState.changeErrorMsg);
                  }
                  
         
                  return Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child:ElevatedButton(
                    onPressed: () {
                      final authBloc = BlocProvider.of<AuthBloc>(context);

                      authBloc.add(
                        ChangePasswordEvent(password: passwordTextController.text),
                         
                      );
                    },
                    child: buttonChild,
                  ));
                },
              ),             
                
              ],
            ))
    );
  }
}
