import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/departments/bloc/dept_bloc.dart';
import 'package:temari_info_flutter/departments/bloc/dept_event.dart';
import 'package:temari_info_flutter/departments/bloc/dept_state.dart';
import 'package:temari_info_flutter/departments/model/dept.dart';
import 'package:temari_info_flutter/presentation/home/home_screen.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

Widget textfield(TextEditingController cont, String hint, String label) {
  return TextFormField(
      controller: cont,
      //obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
        labelText: label,
      ));
}

class AddDepartment extends StatelessWidget {
  static const String routeName = "/AddDepartment";
  final TextEditingController first = TextEditingController();
  final TextEditingController second = TextEditingController();
  final TextEditingController forth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60.0), child: navtop()),
      body: BlocConsumer<DeptAddBloc, DeptAddState>(
        listener: (context, state) {
          if (state is DeptAddFailure) {
            print("failed fetchig");
          }
          if (state is DeptAddSuccess) {
            print(state);
            Navigator.of(context).pushNamed(Home.routeName);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Add Department',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Name',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: textfield(first, "Enter name", "Name"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Years',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: textfield(second, "Enter years", "year")),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Description',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      child:
                          textfield(forth, "Enter Description", "Description")),
                ),
                Container(
                    height: 50.0,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(
                      child: Text('Sumbit'),
                      onPressed: () {
                        print(first.text);
                        final instBloc = BlocProvider.of<DeptAddBloc>(context);
                        instBloc.add(DepartmentAdd(Department(
                            institute_id: "61325e52bba6126e1e5a9ef8",
                            dept_name: first.text,
                            years: second.text,
                            objective: forth.text)));
                      },
                    )),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: bottomnav(context),
    );
  }
}
