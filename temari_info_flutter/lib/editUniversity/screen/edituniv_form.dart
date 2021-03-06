import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/University/bloc/uni_bloc.dart';
import 'package:temari_info_flutter/editUniversity/blocs/editUniv_event.dart';
import 'package:temari_info_flutter/editUniversity/blocs/edituniv_bloc.dart';
import 'package:temari_info_flutter/editUniversity/blocs/edituniv_state.dart';
import 'package:temari_info_flutter/editUniversity/model/editunivmodel.dart';
import 'package:temari_info_flutter/presentation/univ_admin/edit_univ_screen.dart';

import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

Widget textField(String text, double? height, int? maxline,
    TextEditingController controller) {
  return Container(
      height: height,
      child: TextFormField(
        controller: controller,
        maxLines: maxline,
        style: TextStyle(color: Colors.black, fontSize: 14),
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(fontSize: 20),
          // fillColor: Colors.white,
          // filled: true,
          //errorText: validate ? 'Value Can\'t Be Empty' : null,
          enabledBorder: OutlineInputBorder(
            //borderSide: const BorderSide(color: Colors.black38, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            // borderSide: const BorderSide(color: Colors.black12, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ));
}

class EditUnivForm extends StatelessWidget {

  static const String routeName = "/univedit";
  @override
  Widget build(BuildContext context) {
    final univ = ModalRoute.of(context)?.settings.arguments as Map;
    final TextEditingController firstcontroller =
        TextEditingController(text: univ['name']);
    final TextEditingController secondcontroller =
        TextEditingController(text: univ['short_name']);
    final TextEditingController thirdcontroller =
        TextEditingController(text: univ['location']);
    final TextEditingController forthcontroller =
        TextEditingController(text: univ['description']);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60.0), child: navtop()),
      body: BlocConsumer<EditUnivBloc, UnivEditState>(
        listener: (context, state) {
          print(state);
          if (state is EditUnivFailure) {
            print("failed updating");
          }
          if (state is EditUnivSuccess) {
            print(state);
            Navigator.of(context).pushNamed(EditUniv.routeName);
          }
        },
        builder: (context, state) {
          return Center(
              child: Container(
                  height: 550,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    //color: Colors.white,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                  //text(" Name", 20),
                                  textField(
                                      "University Name", 58, 2, firstcontroller)
                                ]),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            //height: 200,
                            width: 200,
                            //color: Colors.amber,
                            child:
                                //color: Colors.blue,
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                  //text(" Name", 20),
                                  textField("your short name", 58, 2,
                                      secondcontroller)
                                ]),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            //height: 200,
                            width: 200,
                            //color: Colors.amber,
                            child:
                                //color: Colors.blue,
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                  //text(" Name", 20),
                                  textField(
                                      "your location", 58, 2, thirdcontroller)
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
                                  // text("Your Description", 20),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  textField("your description", 150, 25,
                                      forthcontroller),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 25,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        print(univ["id"]);
                                        final bloc =
                                            BlocProvider.of<EditUnivBloc>(
                                                context);
                                        bloc.add(UniversityUpdate(
                                            univ["id"],
                                            University(
                                                univ_name:firstcontroller.text,
                                                short_name:secondcontroller.text,
                                                location:thirdcontroller.text,
                                                description:forthcontroller.text)));
                                      },
                                      child: Text('Update Edit'),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ])));
        },
      ),
      bottomNavigationBar: bottomnav(context),
    );
  }
}
