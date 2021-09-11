import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/editInstitute/bloc/edit_inst_bloc.dart';
import 'package:temari_info_flutter/editInstitute/bloc/edit_inst_event.dart';
import 'package:temari_info_flutter/editInstitute/bloc/edit_inst_state.dart';
import 'package:temari_info_flutter/institute/model/institute_model.dart';
import 'package:temari_info_flutter/presentation/univ_admin/edit_inst_screen.dart';
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

class EditInstForm extends StatelessWidget {

  static const String routeName = "/instedit";
  @override
  Widget build(BuildContext context) {
    final inst = ModalRoute.of(context)?.settings.arguments as Map;
    final TextEditingController firstcontroller =
        TextEditingController(text: inst['name']);
    final TextEditingController secondcontroller =
        TextEditingController(text: inst['description']);
    final TextEditingController thirdcontroller =
        TextEditingController(text: inst['email']);
    final TextEditingController forthcontroller =
        TextEditingController(text: inst['phone']);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60.0), child: navtop()),
      body: BlocConsumer<EditInstBloc, InstEditState>(
        listener: (context, state) {
          print(state);
          if (state is EditInstFailure) {
            print("failed updating");
          }
          if (state is EditInstSuccess) {
            print(state);
            Navigator.of(context).pushNamed(EditInst.routeName);
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
                                      "Institute Name", 58, 2, firstcontroller)
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
                                  textField("Description", 58, 2,
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
                                      "Email", 58, 2, thirdcontroller)
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
                                  textField("Phone", 150, 25,
                                      forthcontroller),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 25,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        print(inst["id"]);
                                        final bloc =
                                            BlocProvider.of<EditInstBloc>(
                                                context);
                                        bloc.add(InstituteUpdate(
                                            inst["id"],
                                            Institute(
                                                univ_id: inst['univ_id'],
                                                inst_name:firstcontroller.text,
                                                phone:forthcontroller.text,
                                                email:thirdcontroller.text,
                                                inst_description:secondcontroller.text,)));
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
