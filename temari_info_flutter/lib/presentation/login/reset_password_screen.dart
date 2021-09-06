import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class ResetPassword extends StatelessWidget {
  static const String routeName = "/resetPassword";
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
                      'Enter the code sent to your email',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    // controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Reset code',
                    ),
                  ),
                ),
                      
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
