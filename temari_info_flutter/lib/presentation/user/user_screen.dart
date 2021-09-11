
import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';
import 'package:temari_info_flutter/auth/user_secure_storage.dart';
import 'package:temari_info_flutter/presentation/user/edit_profile_screen.dart';

class Userp extends StatefulWidget {
  const Userp({Key? key}) : super(key: key);
static const String routeName = "/user";
  @override
  UserState createState() {
    return UserState();
  }
}

class UserState extends State {
   
   var curr_username, curr_email;

@override
void initState(){
  super.initState();
  init();
}
Future init() async{
  final current_username = UserSecureStorage.getUsername();
  setState((){
    curr_username =current_username;
  });
}
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: navtop(),),



      body: Container(
        child: profile(curr_username,curr_email, context),
      ),
      



      bottomNavigationBar: bottomnav(context),
    );
  }
}


Widget profile(Future? username, Future? email, BuildContext context ){
  return Container(
    child: Column(
      children: [
        Stack(
          children: [
            Container(
            margin:EdgeInsets.only(bottom: 20),
            width:double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white
              ),
            ),
            Container(
              width:150,
              height: 150,
              margin: EdgeInsets.only(top:80, left:180 ),
              decoration: BoxDecoration(
                color: Colors.pink[800],
                borderRadius: BorderRadius.circular(100.0)
              ),
              child: Center(child: Text("ተማሪ info", style: TextStyle(color:Colors.teal, fontSize: 20),),),

            ),
            Positioned(
              bottom: 2,
              left: 155,
              child:SizedBox(
              width: 200,
              height: 40,
              child:ElevatedButton(onPressed: (){
                                          Navigator.of(context).pushNamed(EditProfile.routeName);

              }, child:  Text('Edit Profile')) ,
            )
             )
            
          ],
        ),
        SizedBox(height: 30,),
        Row(
          children: [
            Icon(Icons.person_outline),
            SizedBox(width: 50,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${username}'),
                SizedBox(height: 10,),
                Text("Name", style: TextStyle(color: Colors.blueGrey),)
              ],
            )
            
          ],
        ),
        SizedBox(height: 30,),
        Row(
          children: [
            Icon(Icons.email),
            SizedBox(width: 50,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${email}'),
                SizedBox(height: 10,),
                Text("Email", style: TextStyle(color: Colors.blueGrey),)
              ],
            )
          ],
        ),
        SizedBox(height: 30,),
        // Row(
        //   children: [
        //     Icon(Icons.edit_rounded),
        //     SizedBox(width: 50,),
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text('${bio}'),
        //         SizedBox(height: 10,),
        //         Text("Bio", style: TextStyle(color: Colors.blueGrey),)
        //       ],
        //     )
        //   ],
        // )
      ],

    ));
}