import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class Reports extends StatelessWidget {
  static const String routeName = "/reports";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: navtop()),
      body:SingleChildScrollView(
        physics: ScrollPhysics(),
        child:
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),

          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext, index) {

            return Container(
    width: 400,
    height: 150,
    padding: EdgeInsets.all(30),
    margin: EdgeInsets.only(top: 40, left: 40, right:40),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.white),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: 100,
            width: 100,
            //add the image here
            // child: Image()
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black)),
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 40),
              child: Text("Report no ${index}", style: TextStyle(color: Colors.black)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Container(
                padding: EdgeInsets.only(right: 10),
                child:ElevatedButton(                  
                      child: Text('Delete Account'),
                      onPressed: () {
                      },
                    ),),
                    Container(
                padding: EdgeInsets.only(right: 10),
                child:ElevatedButton(                  
                      child: Text('Ignore Report'),
                      onPressed: () {
                      },
                    ),),
                
                
                
              ],
            )
          ],
        )
      ],
    ),
  );

            
            }),
        ),
      
      bottomNavigationBar: bottomnav(),
    );
  
    
  }
}