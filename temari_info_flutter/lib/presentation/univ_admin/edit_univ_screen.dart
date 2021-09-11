import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/University/bloc/blocs.dart';
import 'package:temari_info_flutter/presentation/institute/institute_screen.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class EditUniv extends StatelessWidget {
  static const String routeName = "/editUniv";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: navtop(),
      ),
      body: BlocConsumer<UniBloc, UniversityState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<UniBloc>(context);
          print(state);
          if (state is UniversityLoading) {
            // bloc.add(UniversityLoad(univId));
            return CircularProgressIndicator();
          }
          if (state is UniversityOperationFailure) {
            return Center(child: Text("Sorry loading failed"));
          }
          if (state is UniversityOperationSuccess) {
            final univ = state.Universitys;
            print(univ[0]);
            return SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  // university name

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Center(
                      child: Text(
                        univ[0]['univ_name'],
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
                      univ[0]['short_name'],
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  // edit
                  Container(
                    child: Editdescription(),
                  ),

                  // side image and description

                  Container(
                    child: UnivDescription(description: univ[0]['description']),
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
                      // Container(
                      //   margin: EdgeInsets.fromLTRB(270, 0, 5, 0),
                      //   child: Icon(
                      //     Icons.edit,
                      //     color: Colors.yellow,
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      //   child: Icon(
                      //     Icons.delete,
                      //     color: Colors.red,
                      //   ),
                      // ),
                    ],
                  ),

                  // list of institutes

                  Container(
                    width: 500,
                    height: 180,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: univ[0]['institute'].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 150,
                          height: 150,
                          child: ListTile(
                            title: InstituteList(
                              institutes: univ[0]['institute'][index],
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Institute.routeName,
                                arguments: univ[0]['institute'][index]['_id'],
                              );
                            },
                          ),
                        );
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
                    child:  ListView.builder(
                      itemCount: univ[0]['comment'].length,
                      itemBuilder: (context, index) {
                        print('object');
                        print(univ[0]['comment']);
                        return CommentList(comments: univ[0]['comment'][index]);
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: bottomnav(context),
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
              margin: EdgeInsets.fromLTRB(300, 0, 5, 0),
              child: IconButton(
                onPressed: (){

                  
                },
                icon:Icon(
                Icons.edit,
                color: Colors.yellow,
              ),),
              
            ),
            // Container(
            //   margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
            //   child: Icon(
            //     Icons.delete,
            //     color: Colors.red,
            //   ),
            // ),
          ],
        ),

        // university description
      ],
    );
  }
}

class UnivDescription extends StatelessWidget {
   final String description;
   UnivDescription({required this.description});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(30.0),
        //   child: ClipRRect(
        //       borderRadius: BorderRadius.circular(100.0),
        //       child: Container(
        //         height: 120,
        //         width: 120,
        //         color: Colors.white,
        //       )
        //       // child: Image.asset(
        //       //   "images/aau.png",
        //       //   width: 120,
        //       //   height: 120,
        //       //   fit: BoxFit.cover,
        //       // ),
        //       ),
        // ),
        // university description
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            width: 300,
            child: Center(
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InstituteList extends StatelessWidget {
  final Map<String, dynamic> institutes;
  const InstituteList({Key? key, required this.institutes}) : super(key: key);

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
                institutes['inst_name'],
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
  InsertComment({Key? key}) : super(key: key);
  final TextEditingController commentcont = TextEditingController();

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
          width: 250,
          height: 40,
          margin: EdgeInsets.only(bottom: 10),
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: TextFormField(
            controller: commentcont,
            decoration: InputDecoration(
              hintText: 'comment here',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.send, size: 30, color: Colors.teal),
          ),
        ),
      ],
    );
  }
}

class CommentList extends StatelessWidget {
  final Map<String, dynamic> comments;
  const CommentList({Key? key, required this.comments}) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
               comments['user_id']['username'],
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
                comments['comment'],
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
  }
}
