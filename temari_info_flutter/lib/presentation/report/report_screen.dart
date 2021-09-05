import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';



class Report extends StatelessWidget {
  static const String routeName = "/report";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60.0), child: navtop()),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text("Report An Account", style: TextStyle(color: Colors.red[400], fontSize:40, fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),

            textfield2("User Name", 14),
            SizedBox(height: 10,),
            singleLineText(),

            SizedBox(height: 10,),
            textfield2("Email", 14),
            SizedBox(height: 10,),
            singleLineText(),

            SizedBox(height: 10,),
            textfield2("Account to be reported (username)", 14),
            SizedBox(height: 10,),
            singleLineText(),

            SizedBox(height: 10,),
            textfield2("Please provide a valid reason for this action", 14),
            SizedBox(height: 10,),
            multipleLineText(),

            SizedBox(height: 20,),
            SizedBox(
              width:double.infinity,
              child:submitButton() ,
            )
            
          ],
        ),
      ),
      bottomNavigationBar: bottomnav(),
    );
  }
}






//Textfields with single line input
Widget singleLineText() {
  return Form(
    autovalidateMode: AutovalidateMode.always,
    child: TextField(
      style: TextStyle(color: Colors.black, fontSize: 14),
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white30, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white30, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
  ));
}

///multiple line text field
Widget multipleLineText() {
  return TextField(
    minLines: 1,
    maxLines: 5,
    keyboardType: TextInputType.multiline,
    style: TextStyle(color: Colors.black, fontSize: 14),
    decoration: InputDecoration(
      fillColor: Colors.transparent,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white38, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white54, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

Widget submitButton() {
  return SizedBox(
    height: 40,
    child:ElevatedButton(
    onPressed: () {}, child: Text('Submit', style: TextStyle(color: Colors.white60),)) ,) 
  ;
}



Widget textfield2(String text, double fsize) {
  return Text(
    text,
    textAlign: TextAlign.left,
    textDirection: TextDirection.ltr,
    style: TextStyle(
        color: Colors.white60, fontSize: fsize, fontWeight: FontWeight.bold),
  );
}