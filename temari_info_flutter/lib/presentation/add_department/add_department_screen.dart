
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class AddDepartment extends StatelessWidget {
  static const String routeName = "/AddDepartment";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: navtop()),
 body:Padding(
         padding: EdgeInsets.all(10),
         child: ListView(
           children: <Widget>[
          Container(
          padding: EdgeInsets.all(10),
          child:
           
              Text('Add Department', 
              textAlign:TextAlign.center, 
              style:TextStyle(
                fontSize: 30 ),),),
                   Container(
          padding: EdgeInsets.all(10),
          child:
            
              Text('Name',
              textAlign: TextAlign.left,
              textDirection:TextDirection.ltr,
              ),),
            Container(
          padding: EdgeInsets.all(10),
          child:
              
              TextFormField(
               obscureText: true,   
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter name',
                labelText: 'Name',)),
              ),
        Container(
          padding: EdgeInsets.all(10),
          child:
              Text('Years',
              textAlign: TextAlign.left,
              textDirection:TextDirection.ltr,
             ),),
        Container(
          padding: EdgeInsets.all(10),
          child:
              TextFormField(
                obscureText: true,  
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Years',
                labelText: 'Year',)

              ),),
          

        Container(
          padding: EdgeInsets.all(10),
          child:   
              Text('Description',
              textAlign: TextAlign.left,
              textDirection:TextDirection.ltr,),),
        Container(
          padding: EdgeInsets.all(10),
          child:
              Container( 
                
                child:TextFormField(
                  obscureText: true,  
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter description',
                labelText: 'Description',)

              )),),
               Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "submit",
                    
                  ),
                ),
              
            ],
          ),
 ),
    bottomNavigationBar: bottomnav(context),);
  }
}


