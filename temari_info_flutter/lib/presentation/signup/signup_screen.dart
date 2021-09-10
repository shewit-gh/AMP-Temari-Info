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
import 'package:temari_info_flutter/auth/models/auth_model.dart';
import 'package:temari_info_flutter/auth/repository/auth_repo.dart';
import 'package:http/http.dart' as http;
import 'package:temari_info_flutter/presentation/signup/signup_screen.dart';
import 'package:temari_info_flutter/presentation/univ_admin/edit_univ_screen.dart';

class Signup extends StatelessWidget {
  static const String routeName = "/signup";
Signup({Key? key}) : super(key: key);

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
                      'Create an Account',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                   controller: userameTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                   controller: emailTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                    ),
                  ),
                ),
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
                  if (authState is SignedInAsNormalUser) {
                    Navigator.of(context).pushNamed(Home.routeName);
                  };
                },
                builder: (ctx, authState) {
                  Widget buttonChild = Text("Sign Up");
                 
                  if (authState is SignUpInprogress) {
                    buttonChild = SizedBox(
                      height: 4,
                      width: 4,
                      child: Row(children:[CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      Text("Sign up in progress")
                    ]));
                  }
  
                  if (authState is AuthFailed) {
                    buttonChild = Text(authState.errorMsg);
                  }
                  
          final disabled = authState is SigninInprogress || authState is AuthFailed;

                  return Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child:ElevatedButton(
                    onPressed: () {
                      final authBloc = BlocProvider.of<AuthBloc>(context);

                      authBloc.add(
                        SignUpEvent(user:
                          User(username: userameTextController.text,
                            email: emailTextController.text,
                          password: passwordTextController.text
                          ),
                        ),
                      );
                    },
                    child: buttonChild,
                  ));
                },
              ),             
                // Container(
                //   height: 50,
                //     padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                //     child: ElevatedButton(                  
                //       child: Text('Sign Up'),
                //       onPressed: () {
                //       },
                //     )),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text('Already have an account?'),
                      TextButton(
                      child: Text(
                          'Sign In',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                        Navigator.of(context).pushNamed(Login.routeName);

                        },
                    ),
                      
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            ))
    );
  }
}
