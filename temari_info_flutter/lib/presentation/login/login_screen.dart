import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/presentation/admin/admin_univadd_screen.dart';
import 'package:temari_info_flutter/presentation/home/home_screen.dart';
import 'package:temari_info_flutter/presentation/login/forgot_password_screen.dart';
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
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
static const String routeName = "/login";
  @override
  LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State {
  

  // Login({Key? key}) : super(key: key);

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: navtop()),
      bottomNavigationBar:PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: bottomnav(context)),
      body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(height:80),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                        controller: emailTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordTextController,
                          decoration: InputDecoration(
                            suffixIcon: const Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: const Icon(Icons.visibility)),
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            
                          ),
                          validator: (value) {
                            if (value == null || value.length < 6) {
                              return 'Password should have minimum length of 6';
                            }
                            return null;
                          },
                        ),
                      ),
                      Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child:TextButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed(ForgotPassword.routeName);
                
                        },
                        child: Text('Forgot Password?'),
                              ),
                            ),
                      ), 
                      BlocConsumer<AuthBloc, AuthState>(
                      listener: (ctx, authState) {
                        if (authState is SignedInAsNormalUser) {
                          Navigator.of(context).pushNamed(Home.routeName);
                        };
                        if (authState is SignedInAsAdminUser) {
                          Navigator.of(context).pushNamed(UnivAdd.routeName);
                        };
                        if (authState is SignedInAsUnivUser) {
                          Navigator.of(context).pushNamed(EditUniv.routeName);
                        };
                      },
                      builder: (ctx, authState) {
                        Widget buttonChild = Text("Login");
                       
                        if (authState is SigninInprogress) {
                          buttonChild = SizedBox(
                            // height: 4,
                            // width: 4,
                            child: Row(children:[
                            //   CircularProgressIndicator(
                            //   color: Colors.white,
                            // ),
                            Text("...")
                          ]));
                        }
                  
                        if (authState is AuthFailed) {
                          buttonChild = Text(authState.errorMsg);
                        }
                        
                          final disabled = authState is SigninInprogress || authState is AuthFailed;
                
                        return Container(
                        height: 50,
                        width: 350,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child:ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                            final authBloc = BlocProvider.of<AuthBloc>(context);
                
                            authBloc.add(
                              SignInEvent(user:
                                User(email: emailTextController.text,
                                password: passwordTextController.text
                                ),
                              ),
                            );
                          }
                          },
                          child: buttonChild,
                        ));
                      },
                              ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text('Don\'t have an account?'),
                            TextButton(
                            child: Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 15),
                              ),
                              onPressed: () {
                              Navigator.of(context).pushNamed(Signup.routeName);
                
                              },
                          ),
                            
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                      )),
                    ],
                  ),
                )
              ],
            ))
    );
  }
}
