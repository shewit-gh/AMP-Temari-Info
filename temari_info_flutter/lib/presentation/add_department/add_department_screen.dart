
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDepartment extends StatelessWidget {
  static const String routeName = "/AddDepartment";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
         child: Card(  
          shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(15.0),  
          ),
        child: Form(
      
          child: Column(
            
           crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               Text('Name',
              textAlign: TextAlign.left,
              textDirection:TextDirection.ltr),
              
              TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter name',
                labelText: 'Name',)

              ),
              Text('Phone',
              textAlign: TextAlign.left,
              textDirection:TextDirection.ltr),
              TextFormField(
              decoration: InputDecoration(

                hintText: 'Enter Phone',
                labelText: 'Phone',)

              ),
              Text('Email',
              textAlign: TextAlign.left,
              textDirection:TextDirection.ltr),
              TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter email',
                labelText: 'email',)

              ),
              Text('Description',
              textAlign: TextAlign.left,
              textDirection:TextDirection.ltr),
              Container( 
                height:300.0,
                child:TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 100.0),
                hintText: 'Enter description',
                labelText: 'Description',)

              )),
               Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
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
    )))));
  }
}


