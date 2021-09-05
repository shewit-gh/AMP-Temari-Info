import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/contact/contact_screen.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';



class Report extends StatelessWidget {
  static const String routeName = "/report";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60.0), child: navtop()),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            textfield("Report An Account", 42),
            SizedBox(height: 20,),

            textfield("User Name", 14),
            SizedBox(height: 10,),
            singleLineText(),

            SizedBox(height: 10,),
            textfield("Email", 14),
            singleLineText(),

            SizedBox(height: 10,),
            textfield("Account to be reported (username)", 14),
            singleLineText(),

            SizedBox(height: 10,),
            textfield("Please provide a valic reason for this action", 14),
            singleLineText(),
            submitButton()
          ],
        ),
      ),
      bottomNavigationBar: bottomnav(),
    );
  }
}






//Textfields with single line input
Widget singleLineText() {
  return TextField(
    style: TextStyle(color: Colors.black, fontSize: 14),
    decoration: InputDecoration(
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black38, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black12, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

///multiple line text field
Widget multipleLineText() {
  return TextField(
    minLines: 1,
    maxLines: 5,
    keyboardType: TextInputType.multiline,
    style: TextStyle(color: Colors.black, fontSize: 14),
    decoration: InputDecoration(
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black38, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black12, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

Widget submitButton() {
  return SizedBox(
    height: 40,
    child:ElevatedButton(
    onPressed: () {}, child: Text('Submit')) ,) 
  ;
}


Widget textfield(String text, double fsize) {
  return Text(
    text,
    textAlign: TextAlign.left,
    textDirection: TextDirection.ltr,
    style: TextStyle(
        color: Colors.red[900], fontSize: fsize, fontWeight: FontWeight.bold),
  );
}