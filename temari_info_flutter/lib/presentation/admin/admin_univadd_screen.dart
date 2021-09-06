//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

Widget text(String text, double fsize) {
  return Text(
    text,
    textAlign: TextAlign.left,
    textDirection: TextDirection.ltr,
    style: TextStyle(
        color: Colors.blueGrey, fontSize: fsize, fontWeight: FontWeight.bold),
  );
}

Widget textField(double? height, int? maxline) {
  return Container(
      height: height,
      child: TextFormField(
        maxLines: maxline,
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
      ));
}

class UnivAdd extends StatelessWidget {
  static const String routeName = "/univadd";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60.0), child: navtop()),
      body: Center(
          child: Container(
              height: 550,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        //height: 200,
                        width: 200,
                        //color: Colors.amber,
                        child:
                            //color: Colors.blue,
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              text(" Name", 20),
                              textField(58, 2)
                            ]),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        //height: 200,
                        width: 200,
                        //color: Colors.red,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              text("Your Description", 20),
                              SizedBox(
                                height: 15,
                              ),
                              textField(150, 25),
                              SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Send message'),
                                ),
                              )
                            ]),
                      ),
                    ),
                  ]))),
      bottomNavigationBar: bottomnav(),
    );
  }
}
