import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/institute/blocs/institute_bloc.dart';
import 'package:temari_info_flutter/institute/blocs/institute_event.dart';
import 'package:temari_info_flutter/institute/blocs/institute_state.dart';
import 'package:temari_info_flutter/institute/model/institute_model.dart';
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

class AddInst extends StatelessWidget {
  static const String routeName = "/AddInst";
  final TextEditingController first = TextEditingController();
  final TextEditingController second = TextEditingController();
  final TextEditingController third = TextEditingController();
  final TextEditingController forth = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60.0), child: navtop()),
      body: BlocConsumer<InstAddBloc, InstAddState>(
        listener: (context, state) {
          if (state is InstAddFailure) {
            print("failed fetchig");
          }
          if (state is InstAddSuccess) {
            print(state);
            Navigator.of(context).pushNamed(Home.routeName);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                // Center(
                // child: Padding(
                // padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 25.0),
                //  child: Card(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(15.0),

                //   ),
                //   color: Colors.white,
                // child: Form(

                //   child: Column(

                //    crossAxisAlignment: CrossAxisAlignment.stretch,
                SizedBox(height: 50),
                Container(
                    child: Text(
                  'Add Institue',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                )),
                // Padding(
                // padding: const EdgeInsets.all(25)),
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
                    child: textfield(first, "Enter name", "Name")),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Phone',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: textfield(second, "Enter phone", "Phone"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Email',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: textfield(third, "Enter email", "email"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Description',
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                      style: TextStyle()),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child:
                        textfield(forth, "Enter Description", "Description")),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(
                      child: Text('Sumbit'),
                      onPressed: () {
                        print(first.text);
                        final instBloc = BlocProvider.of<InstAddBloc>(context);
                        instBloc.add(InstituteAdd(Institute(
                            univ_id: "61325e52bba6126e1e5a9ef8",
                            inst_name: first.text,
                            phone: second.text,
                            email: third.text,
                            inst_description: forth.text)));
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
