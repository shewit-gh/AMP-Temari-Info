
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
       body: Center(
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 25.0),
         child: Card(  
          shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(15.0), 
             
          ),
          color: Colors.white,
        child: Form(
      
          child: Column(
            
           crossAxisAlignment: CrossAxisAlignment.stretch,
           
            children: [
              Text('Add Department', 
              textAlign:TextAlign.center, 
              style:TextStyle(
                color: Colors.black,
                fontSize: 30 ),),
              Padding(
              padding: const EdgeInsets.all(25)),
            
              Text('Name',
              textAlign: TextAlign.left,
              textDirection:TextDirection.ltr,
              style: TextStyle(color: Colors.black,
              fontSize:22.0,
              )),
              
              TextFormField(
               obscureText: true,   
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter name',
                labelText: 'Name',)

              ),
              Text('Years',
              textAlign: TextAlign.left,
              textDirection:TextDirection.ltr,
               style: TextStyle(color: Colors.black,
              fontSize:22.0,
              )),
              TextFormField(
                obscureText: true,  
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Years',
                labelText: 'Year',)

              ),
          

            
              Text('Description',
              textAlign: TextAlign.left,
              textDirection:TextDirection.ltr, style: TextStyle(color: Colors.black,
              fontSize:22.0,
              )),
              Container( 
                
                child:TextFormField(
                  obscureText: true,  
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter description',
                labelText: 'Description',)

              )),
               Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              
            ],
          ),
    )))),
    bottomNavigationBar: bottomnav(context),);
  }
}


