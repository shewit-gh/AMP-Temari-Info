import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/auth/bloc/auth_bloc.dart';
import 'package:temari_info_flutter/auth/bloc/auth_event.dart';
import 'package:temari_info_flutter/auth/bloc/auth_state.dart';
import 'package:temari_info_flutter/presentation/login/login_screen.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class ResetPassword extends StatelessWidget {
  static const String routeName = "/resetPassword";
  final tokenTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
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
                      'Enter the code sent to your email',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: tokenTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Reset code',
                    ),
                  ),
                ),Container(
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
                    controller: confirmPasswordTextController,
                    decoration: InputDecoration(
                      suffixIcon: const Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: const Icon(Icons.visibility)),
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                    ),
                  ),
                ),         
                      
                BlocConsumer<AuthBloc, AuthState>(
                listener: (ctx, authState) {
                  if (authState is ResetPasswordSuccess) {
                    Navigator.of(context).pushNamed(Login.routeName);
                  };
                  
                },
                builder: (ctx, authState) {
                  Widget buttonChild = Text("reset password");
                 
                  if (authState is ResetPasswordInprogress) {
                    buttonChild = SizedBox(
                      height: 4,
                      width: 4,
                      child: Row(children:[CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      Text("Reseting password")
                    ]));
                  }
  
                  if (authState is ResetPasswordFailed) {
                    buttonChild = Text(authState.resetErrorMsg);
                  }
                  
         
                  return Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child:ElevatedButton(
                    onPressed: () {
                      final authBloc = BlocProvider.of<AuthBloc>(context);

                      authBloc.add(
                        ResetPasswordEvent(reset_link: tokenTextController.text,password:passwordTextController.text),
                         
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
