import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/institute/blocs/institute_bloc.dart';
import 'package:temari_info_flutter/institute/blocs/institute_event.dart';
import 'package:temari_info_flutter/institute/blocs/institute_state.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class Institute extends StatelessWidget {
  static const String routeName = "/institute";
  @override
  Widget build(BuildContext context) {
    final instId = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: navtop(),
      ),
      body: BlocConsumer<InstituteBloc, InstituteState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<InstituteBloc>(context);
          print(state);
          if (state is InstituteLoading) {
            bloc.add(InstituteDetail(instId));
            
            return CircularProgressIndicator();
          }
          if (state is InstituteLoadFail) {
            return Center(child: Text("Sorry loading failed"));
          }
          if (state is InstituteLoaded) {
            
            final inst = state.institute[0]['data'][0];
            print(inst);
            return SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  // university name

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Center(
                      child: Text(inst['univ_id']['univ_name'],
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
                      child: Text(inst['inst_name'],
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
                      child: Text( inst['email'],
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
                        child: Text(inst['phone'],
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // side image and description

                  Container(
                    child: InstDescription(inst['inst_description']),
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
                      itemCount: inst['department_id'].length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                       return DepartmnetList( department_id: inst['department_id'][index],);
                        
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

class InstDescription extends StatelessWidget {
  final String description;
  InstDescription(this.description);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // university image

        // Padding(
        //   padding: const EdgeInsets.all(30.0),
        //   child: 
        //   ClipRRect(
        //     borderRadius: BorderRadius.circular(100.0),
        //     // child: Container(
        //     //   height: 120,
        //     //   width: 120,
        //     //   color: Colors.white,
        //     // )
        //     child: Image.asset(
        //       "image/aau.png",
        //       width: 120,
        //       height: 120,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
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

class DepartmnetList extends StatelessWidget {
  final Map<String, dynamic> department_id;

    const DepartmnetList({Key? key, required this.department_id}) : super(key: key);

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
                department_id['dept_name'],
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
                "* ${department_id['years']} years to finish",
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                ),
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
                  department_id['objective'],
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
