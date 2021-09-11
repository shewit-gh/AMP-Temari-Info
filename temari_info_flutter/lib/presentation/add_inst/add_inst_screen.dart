import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class AddInst extends StatelessWidget {
  static const String routeName = "/AddInst";
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
        SizedBox(height: 50),
        Container(
              child:Text('Add Institue', 
              textAlign:TextAlign.center, 
              style:TextStyle(
                
                fontSize: 30 ),)),
              // Padding(
              // padding: const EdgeInsets.all(25)),
        Container(
          padding: EdgeInsets.all(10),
          child:Text('Name',
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
                labelText: 'Name',)

              ),),
        Container(
          padding: EdgeInsets.all(10),
          child:
              Text('Phone',
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
                hintText: 'Enter Phone',
                labelText: 'Phone',)

              ),),
        Container(
          padding: EdgeInsets.all(10),
          child:
              Text('Email',

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
                hintText: 'Enter email',
                labelText: 'email',
                 ),
  
              ),),
        Container(
          padding: EdgeInsets.all(10),
          child:
              Text('Description',
              textAlign: TextAlign.left,
              textDirection:TextDirection.ltr, style: TextStyle(

              )),),
         Container( 
           padding: EdgeInsets.all(10),
                
                child:TextFormField(
                  obscureText: true,  
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter description',
                labelText: 'Description',)

              )),
               Container(
                height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(                  
                      child: Text('Sumbit'),
                      onPressed: () {
                      },
                    )
                ),
              
            ],
          ),
    ),
    bottomNavigationBar: bottomnav(context),);
  }
}