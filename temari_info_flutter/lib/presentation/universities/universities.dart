import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/University/bloc/uni_bloc.dart';
import 'package:temari_info_flutter/University/bloc/university_event.dart';
import 'package:temari_info_flutter/University/bloc/university_state.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';
import 'package:temari_info_flutter/presentation/university/university_screen.dart';

class Universities extends StatelessWidget {
  static const String routeName = "/universities";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60.0), child: navtop()),
      body: BlocConsumer<UniBloc, UniversityState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<UniBloc>(context);
          print(state);
          if (state is UniversityLoading) {
            bloc.add(UniversityListLoad());
            return CircularProgressIndicator();
          }
          if (state is UniversityOperationFailure) {
            return Center(child: Text("Sorry loading failed"));
          }
          if (state is UniversityOperationSuccess) {
            final univ = state.Universitys;
            print(univ);
            return Center(
              child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.all(25),
                      child: Text("Universities",
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 30,
                          )),
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: univ.length,
                        itemBuilder: (BuildContext, index) {
                          return ListTile(
                            onTap: () {
                              // bloc.add(UniversityLoad(univ[index]['_id']));
                              // if (state is UniversityOperationSuccess) {
                                Navigator.pushNamed(
                                  context,
                                  University.routeName,
                                  arguments: univ[index]['_id'],
                                  
                                );
                                // print(univ[index]['_id']);
                              // }
                            },
                            title: _univCard(univ[index]['univ_name'], 450),
                          );
                        }),
                  ])),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      drawer: drawer(context),
      bottomNavigationBar: bottomnav(),
    );
  }
}

Widget _univCard(String univ_name, int totalRating) {
  return Container(
    width: 400,
    height: 150,
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.only(top: 40, left: 40, right: 40),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.white),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          // child:Image.asset('image/aau.png', width: 110, height: 110, fit: BoxFit.cover,)
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 40),
              child: Text(univ_name, style: TextStyle(color: Colors.black)),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     _starIcon(),
            //     _starIcon(),
            //     _starIcon(),
            //     _starIcon(),
            //     _starIcon(),
            //     Container(
            //       padding: EdgeInsets.only(left: 20),
            //       child: Text(
            //         "${totalRating}",
            //         style: TextStyle(color: Colors.black),
            //       ),
            //     )
            //   ],
            // )
          ],
        )
      ],
    ),
  );
}

Widget _starIcon() {
  return Icon(Icons.star_outline, color: Colors.blueGrey);
}
