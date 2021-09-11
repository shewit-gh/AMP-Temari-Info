import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/University/bloc/uni_bloc.dart';
import 'package:temari_info_flutter/University/bloc/university_event.dart';
import 'package:temari_info_flutter/University/bloc/university_state.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';
import 'package:temari_info_flutter/presentation/university/university_screen.dart';

import 'admin_univadd_screen.dart';

class Admin extends StatelessWidget {
  static const String routeName = "/admin";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60.0), child: navtop()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            UnivAdd.routeName,
          );
        },
        child: Icon(Icons.add),
      ),
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
                          return _univCard(univ[index]['univ_name'], 450);
                        }),
                  ])),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Widget _univCard(String univ_name, int totalRating) {
  return Container(
    width: 400,
    height: 130,
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.only(top: 40, left: 40, right: 40),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.white),
    child: Center(
      child: Text(
        univ_name,
        style: TextStyle(color: Colors.black, fontSize: 25),
      ),
    ),
  );
}
