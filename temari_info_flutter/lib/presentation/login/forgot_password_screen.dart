import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/auth/bloc/auth_bloc.dart';
import 'package:temari_info_flutter/auth/bloc/auth_event.dart';
import 'package:temari_info_flutter/auth/bloc/auth_state.dart';
import 'package:temari_info_flutter/presentation/login/reset_password_screen.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class ForgotPassword extends StatelessWidget {
  static const String routeName = "/forgotPassword";
   final emailTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                      'Enter your email address',
                      style: TextStyle(fontSize: 20),
                    )),
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
                      height: 4,
                      width: 4,
                      child: Row(children:[CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      Text("Sending Email to your account")
                    ]));
                  }
  
                  if (authState is ForgotPasswordFailed) {
                    buttonChild = Text(authState.forgotErrorMsg);
                  }
                  
         
                  return Container(
                  height: 50,
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
            ))
    );
  }
}
