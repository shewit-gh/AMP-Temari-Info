import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class About extends StatelessWidget {
  static const String routeName = "/about";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: navtop(),
        ),
        body: about(),
        bottomNavigationBar: bottomnav(context));
  }
}

Widget about() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top:20, left:10, bottom: 20),
          child:Text("Dedicated Team"
          "For Your Dedicated Dream", style: TextStyle(color:Colors.teal, fontSize: 20, fontWeight:FontWeight.w600,))
          ),

        // Container(
        //   width: 550,
        //   height: 250,
        //   child:
        //     Image.asset(
        //       'image/5251.jpg',
        //         fit: BoxFit.cover,
        //     )
        // ),
        Padding(padding: EdgeInsets.only(top: 20, left:20),
        child: Column(children: [
            Text("TEMARI INFO !?", style: TextStyle(color:Colors.teal, fontSize: 20, fontWeight:FontWeight.w600,)),
            SizedBox(height: 40,),
            Row(
              children: [
                Container(
                  width: 210,
                  child: Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s," 
                "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                "It has survived not only five centuries, but also the leap into electronic typesetting,"
                "remaining essentially unchanged."
               
                )
                  
                ),
                SizedBox(width: 50),
                Container(
                   width: 110,
                  child:  Text(
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                "It has survived not only five centuries, but also the leap into electronic typesetting,"
                "remaining essentially unchanged."
                )
                  
                )
               
              ],
            )
        ],),)
        
        
      ],
        )
      

  );
}
