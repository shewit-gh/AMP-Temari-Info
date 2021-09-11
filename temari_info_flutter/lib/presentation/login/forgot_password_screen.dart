import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/auth/bloc/auth_bloc.dart';
import 'package:temari_info_flutter/auth/bloc/auth_event.dart';
import 'package:temari_info_flutter/auth/bloc/auth_state.dart';
import 'package:temari_info_flutter/presentation/login/reset_password_screen.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  static const String routeName = "/forgotPassword";
  @override
  ForgotPasswordState createState() {
    return ForgotPasswordState();
  }
}

class ForgotPasswordState extends State {
   final emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: navtop()),
      // bottomNavigationBar:PreferredSize(
      //   preferredSize: Size.fromHeight(60.0),
      //   child: bottomnav(context)),
      body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(height:80),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Enter your email address',
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
                            labelText: 'Email Address',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                        ),
                      ),
                            
                      BlocConsumer<AuthBloc, AuthState>(
                      listener: (ctx, authState) {
                        if (authState is ForgotPasswordSuccess) {
                          Navigator.of(context).pushNamed(ResetPassword.routeName);
                        };
                        
                      },
                      builder: (ctx, authState) {
                        Widget buttonChild = Text("Change password");
                       
                        if (authState is ForgotPasswordInprogress) {
                          buttonChild = SizedBox(
                          
                            child: Row(children:[CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            Text("...")
                          ]));
                        }
                  
                        if (authState is ForgotPasswordFailed) {
                          buttonChild = Text(authState.forgotErrorMsg);
                        }
                        
                         
                        return Container(
                        height: 50,
                        width: 350,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child:ElevatedButton(
                          onPressed: () {
                            final authBloc = BlocProvider.of<AuthBloc>(context);
                
                            authBloc.add(
                              ForgotPasswordEvent(email: emailTextController.text),
                               
                            );
                          },
                          child: buttonChild,
                        ));
                      },
                              ),
                    ],
                  ),
                ),     
                
              ],
            ))
    );
  }
}
