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
        //controller: textt,
        maxLines: maxline,
        style: TextStyle(color: Colors.black, fontSize: 14),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          //errorText: validate ? 'Value Can\'t Be Empty' : null,
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

class Contact extends StatelessWidget {
  static const String routeName = "/contact";

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("Get in touch with us", 25),
                    SizedBox(
                      height: 50,
                    ),
                    text("your Name", 15),
                    SizedBox(
                      height: 10,
                    ),
                    textField(35, 1),
                    SizedBox(
                      height: 20,
                    ),
                    text("your email", 15),
                    SizedBox(
                      height: 10,
                    ),
                    textField(35, 1),
                    SizedBox(
                      height: 10,
                    ),
                    text("your message here", 15),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 185,
                        child: textField(
                          125,
                          20,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Send message'),
                      ),
                    )
                  ]))),
      drawer: drawer(context),
      bottomNavigationBar: bottomnav(),
    );
  }
}
