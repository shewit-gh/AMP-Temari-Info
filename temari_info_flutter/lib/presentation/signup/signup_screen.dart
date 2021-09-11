import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/presentation/home/home_screen.dart';
import 'package:temari_info_flutter/presentation/login/login_screen.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';
import 'package:temari_info_flutter/auth/bloc/auth_bloc.dart';
import 'package:temari_info_flutter/auth/bloc/auth_event.dart';
import 'package:temari_info_flutter/auth/bloc/auth_state.dart';
import 'package:temari_info_flutter/auth/models/auth_model.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
static const String routeName = "/signup";
  @override
  SignupState createState() {
    return SignupState();
  }
}

class SignupState extends State {
  static const String routeName = "/signup";

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final userameTextController = TextEditingController();
  final confirmpasswordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: navtop()),
      // bottomNavigationBar:PreferredSize(
      //   preferredSize: Size.fromHeight(60.0),
        // child: bottomnav(context)),
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                         controller: userameTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'User Name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty ) {
                              return 'Enter Username';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                         controller: emailTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email Address',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty || !(value.contains('@'))) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordTextController,
                          decoration: InputDecoration(
                            // suffixIcon: const Padding(
                            // padding: const EdgeInsets.only(right: 0),
                            // child: const Icon(Icons.visibility)),
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
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: TextFormField(
                          obscureText: true,
                          controller: confirmpasswordTextController,
                          decoration: InputDecoration(
                            // suffixIcon: const Padding(
                            // padding: const EdgeInsets.only(right: 0),
                            // child: const Icon(Icons.visibility)),
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                          ),
                          validator: (value) {
                            if (value == null || value.length < 6) {
                              return 'Password should have minimum length of 6';
                            }
                            if(passwordTextController.text != confirmpasswordTextController.text){
                              return 'should match with entered password';
                            }
                            return null;
                          },
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
                            child: Row(children:[
                            //   CircularProgressIndicator(
                            //   color: Colors.white,
                            // ),
                            Text(".")
                          ]));
                        }
                  
                        if (authState is AuthFailed) {
                          buttonChild = Text(authState.errorMsg);
                        }
                        
                         
                        return Container(
                        height: 50,
                        width: 350,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child:ElevatedButton(
                          onPressed: () {

                            if (_formKey.currentState!.validate()) {
                            final authBloc = BlocProvider.of<AuthBloc>(context);
                
                            authBloc.add(
                              SignUpEvent(user:
                                User(username: userameTextController.text,
                                  email: emailTextController.text,
                                password: passwordTextController.text
                                ),
                              ),
                            );
                          }},
                          child: buttonChild,
                        ));
                      },
                              ),
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
                  ),
                ),             
                // Container(
                //   height: 50,
                //     padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                //     child: ElevatedButton(                  
                //       child: Text('Sign Up'),
                //       onPressed: () {
                //       },
                //     )),
                
              ],
            ))
    );
  }
}
