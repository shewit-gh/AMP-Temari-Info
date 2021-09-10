import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:temari_info_flutter/comment/blocs/comment_bloc.dart';
import 'package:temari_info_flutter/comment/blocs/comment_event.dart';
import 'package:temari_info_flutter/comment/blocs/comment_state.dart';
import 'package:temari_info_flutter/comment/data_provider/comment_data.dart';
import 'package:temari_info_flutter/comment/repo/comment_repo2.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class University extends StatelessWidget {
  static const String routeName = "/university";
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
                    fontSize: 23,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),

            // shoert university name
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Text(
                "(AAU)",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                ),
              ),
            ),

            // side image and description

            Container(
              child: UnivDescription(),
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 10, 0),
                  child: Text(
                    "Instituties",
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ),
              ],
            ),

            // list of institutes

            Container(
              width: 500,
              height: 180,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InstituteList();
                },
              ),
            ),

            // number of comments

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
                  child: Text(
                    "0 Coments",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),

            // insert a comment
            Container(child: InsertComment()),

            //list of comments

            Container(
              width: 600,
              height: 600,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CommentList();
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

class UnivDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // university image

        Padding(
          padding: const EdgeInsets.all(30.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Container(
                height: 120,
                width: 120,
                color: Colors.white,
              )
              // child: Image.asset(
              //   "image/aau.png",
              //   width: 120,
              //   height: 120,
              //   fit: BoxFit.cover,
              // ),
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

class InstituteList extends StatelessWidget {
  const InstituteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 150,
              height: 150,
              margin: EdgeInsets.all(10.0),
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
              width: 150,
              height: 150,
              margin: EdgeInsets.all(25.0),
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Addis Ababa Institute of Technology ",
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InsertComment extends StatelessWidget {
  const InsertComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //arrange the alignment
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Icon(
            Icons.person,
            // color: Colors.black54,
          ),
        ),
        Container(
          width: 300,
          height: 40,
          margin: EdgeInsets.only(bottom: 10),
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'comment here',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 0),
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                Icons.send,
                // color: Colors.black54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class CommentList extends StatefulWidget {
 CommentList({Key? key}) : super(key: key);

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
 final CommentRepo2 commentRepo=CommentRepo2(
  dataProvider: CommentDataProvider(httpClient: http.Client()));

  Widget build(BuildContext context) {
   final CommentBloc commentBloc= CommentBloc(commentRepo: commentRepo);
  return BlocBuilder <CommentBloc, CommentState>(
    bloc:commentBloc,
    builder:(context,state) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 500,
              height: 80,
              margin: EdgeInsets.all(5.0),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(15.0),
              // color: Colors.white70,
              // ),
            ),
          ),
          Positioned(
            top: 15,
            left: 10,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.person,
                // color: Colors.black54,
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: 50,
            child: Container(
              width: 400,
              height: 20,
              // margin: EdgeInsets.all(10.0),
              // padding: EdgeInsets.all(5.0),
              child: Text(
                "@username",
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  // color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 50,
            child: Container(
              width: 400,
              height: 70,
              padding: EdgeInsets.fromLTRB(3, 5, 0, 5),
              child: Text(
                commentBloc.add(CommentEvent( GetComment)),
               
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  // color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    });
    }
}

