import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/auth/bloc/auth_bloc.dart';
import 'package:temari_info_flutter/auth/bloc/auth_event.dart';
import 'package:temari_info_flutter/auth/bloc/auth_state.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';
import 'package:temari_info_flutter/auth/user_secure_storage.dart';
import 'package:temari_info_flutter/presentation/user/user_screen.dart';


class EditProfile extends StatelessWidget {
  static const String routeName = "/EditProfile";
  final emailTextController = TextEditingController();
  final userTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final current_username = UserSecureStorage.getUsername();
  final current_email = UserSecureStorage.getEmail();
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
                SizedBox(height:50),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Edit your profile',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                  controller: userTextController,
                    // initialValue: current_username,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                  controller: emailTextController,
                    // initialValue: "abebe@gmail.com",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                    ),
                  ),
                ),
                       
                 BlocConsumer<AuthBloc, AuthState>(
                listener: (ctx, authState) {
                  if (authState is EditProfileSuccess) {
                    Navigator.of(context).pushNamed(Userp.routeName);
                  };
                },
                builder: (ctx, authState) {
                  Widget buttonChild = Text("Edit Profile");
                 
                  if (authState is EditProfileInProgress) {
                    buttonChild = SizedBox(
                
                      child: Row(children:[CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      Text("...")
                    ]));
                  }
  
                  if (authState is EditProfileFailed) {
                    buttonChild = Text(authState.editErrorMsg);
                  }
  
                  return Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child:ElevatedButton(
                    onPressed: () {
                      final authBloc = BlocProvider.of<AuthBloc>(context);

                      authBloc.add(
                        EditProfileEvent(username: userTextController.text, email: emailTextController.text),
                         
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
