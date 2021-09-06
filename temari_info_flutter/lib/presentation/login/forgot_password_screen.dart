import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class Login extends StatelessWidget {
  static const String routeName = "/login";
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
                SizedBox(height:80),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    // controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
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
                Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child:TextButton(
                  onPressed: (){
                  },
                  child: Text('Forgot Password?'),
                        ),
                      ),
                ),               
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: Text('Login'),
                      onPressed: () {
                      },
                    )),
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
