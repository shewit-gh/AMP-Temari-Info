import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class EditInst extends StatelessWidget {
  static const String routeName = "/editUniv";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: navtop(),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            // university name

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Text(
                  "Addis Ababa University",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),

            // institute name

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Text(
                  "Addis Ababa institute of technology",
                  style: TextStyle(
                    fontSize: 23,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),

            // email

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Text(
                  "infoaau@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),

            // phone

            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.phone,
                    color: Colors.teal,
                    // color: Colors.black54,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 0, 8),
                  child: Text(
                    "0911234567",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

            // edit
            Container(
              child: Editdescription(),
            ),

            // side image and description

            Container(
              child: InstDescription(),
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 10, 0),
                  child: Text(
                    "Departments",
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ),
              ],
            ),

            // list of departments

            Container(
              width: 500,
              height: 600,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return DepartmnetList();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomnav(),
    );
  }
}

class Editdescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(400, 0, 5, 0),
              child: Icon(
                Icons.edit,
                color: Colors.yellow,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),

        // university description
      ],
    );
  }
}

class InstDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // university image

        Padding(
          padding: const EdgeInsets.all(30.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            // child: Container(
            //   height: 120,
            //   width: 120,
            //   color: Colors.white,
            // )
            child: Image.asset(
              "images/aau.png",
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // university description
        Container(
          width: 300,
          child: Center(
            child: Text(
              "Addis Ababa University (AAU), is the oldest and the "
              "research institution in Ethiopia. largest higher learning and"
              " Since its inception, the University has been the"
              "leading center in teaching-learning, research and community services.",
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DepartmnetList extends StatelessWidget {
  const DepartmnetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 500,
              height: 250,
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 400,
              height: 50,
              margin: EdgeInsets.all(25.0),
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Software Engineering ",
                style: TextStyle(
                  fontSize: 22,
                  decoration: TextDecoration.none,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 30,
            child: Container(
              width: 400,
              height: 40,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(5.0),
              child: Text(
                "* 5 years to finish",
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 400,
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Icon(
                Icons.edit,
                color: Colors.yellow,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 430,
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 30,
            child: Container(
              width: 400,
              height: 150,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  "Addis Ababa University (AAU), is the oldest and the "
                  "research institution in Ethiopia. largest higher learning and"
                  " Since its inception, the University has been the"
                  "leading center in teaching-learning, research and community services.",
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
