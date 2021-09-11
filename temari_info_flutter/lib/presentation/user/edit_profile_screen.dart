import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class EditProfile extends StatelessWidget {
  static const String routeName = "/EditProfile";
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
                    // controller: nameController,
                    initialValue: "Abebe",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    // controller: emailController,
                    initialValue: "abebe@gmail.com",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextFormField(
                    obscureText: true,
                    initialValue: "abcd",
                    // controller: passwordController,
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
                  child: TextFormField(
                    obscureText: true,
                    initialValue: "abcd",
                    // controller: confirmpasswordController,
                    decoration: InputDecoration(
                      suffixIcon: const Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: const Icon(Icons.visibility)),
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                    ),
                  ),
                ),              
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(                  
                      child: Text('Submit'),
                      onPressed: () {
                      },
                    )),
                
              ],
            ))
    );
  }
}
