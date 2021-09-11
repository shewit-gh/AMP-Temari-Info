
import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';
import 'package:temari_info_flutter/auth/user_secure_storage.dart';

class Userp extends StatelessWidget {
  static const String routeName = "/user";
  final current_username = UserSecureStorage.getUsername();
  final current_email = UserSecureStorage.getEmail();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: navtop(),),



      body: Container(
        child: profile(current_username,current_email),
      ),
      



      bottomNavigationBar: bottomnav(context),
    );
  }
}


Widget profile(Future username, Future email ){
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
              child:ElevatedButton(onPressed: (){}, child:  Text('Edit Profile')) ,
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