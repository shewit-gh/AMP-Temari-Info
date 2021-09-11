import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/University/bloc/uni_bloc.dart';
import 'package:temari_info_flutter/University/bloc/university_event.dart';
import 'package:temari_info_flutter/University/model/university.dart';
import 'package:temari_info_flutter/University/bloc/university_state.dart';
import 'package:temari_info_flutter/presentation/home/home_screen.dart';
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

class UnivAdd extends StatelessWidget {
  final TextEditingController firstcontroller = TextEditingController();
  final TextEditingController secondcontroller = TextEditingController();
  final TextEditingController thirdcontroller = TextEditingController();
  final TextEditingController forthcontroller = TextEditingController();

  static const String routeName = "/univadd";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60.0), child: navtop()),
      body: BlocConsumer<UnivAddBloc, UnivAddState>(
        listener: (context, state) {
          if (state is UnivAddFailure) {
            print("failed fetchig");
          }
          if (state is UnivAddSuccess) {
            print(state);
            Navigator.of(context).pushNamed(Home.routeName);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Center(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              //text(" Name", 20),
                              textField("your name", 58, 2, firstcontroller)
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              //text(" Name", 20),
                              textField(
                                  "your short name", 58, 2, secondcontroller)
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              //text(" Name", 20),
                              textField("your location", 58, 2, thirdcontroller)
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
                            textField(
                                "your description", 150, 25, forthcontroller),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 35,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  print(firstcontroller.text);
                                  final uniBloc =
                                      BlocProvider.of<UnivAddBloc>(context);
                                  uniBloc.add(UniversityCreate(University(
                                      univ_name: firstcontroller.text,
                                      short_name: secondcontroller.text,
                                      location: thirdcontroller.text,
                                      description: forthcontroller.text)));
                                },
                                child: Text('Send message'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
