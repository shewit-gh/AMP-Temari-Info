import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temari_info_flutter/University/bloc/uni_bloc.dart';
import 'package:temari_info_flutter/University/bloc/university_event.dart';
import 'package:temari_info_flutter/University/bloc/university_state.dart';
import 'package:temari_info_flutter/University/model/university.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';
import 'package:temari_info_flutter/presentation/university/university_screen.dart';

class Search extends StatelessWidget {
  static const String routeName = "/search";
  @override
  Widget build(BuildContext context) {
    final univname = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60.0), child: navtop()),
      body: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<SearchBloc>(context);
          print(state);
          if (state is UnivSearchLoading){
            bloc.add(UnivSearchLoad(univname));
          }
           if (state is UnivSearchFailure) {
            return Center(child: Text("Sorry Searching failed"));
          }

          if(state is UnivSearchSuccess ){
            final result = state.Universitys[0];
            // print(result);
            return Center(
            child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.all(25),
                    child: Text("Search Result",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 30,
                        )),
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: result.length,
                      itemBuilder: (BuildContext, index) {
                        return _univCard(context, result[index]['univ_name'], 450, result[index]['_id']);
                      }),
                ])),
          );
          }
          return Container(
            width: 400,
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
  
      ),
      drawer: drawer(context),
      bottomNavigationBar: bottomnav(context),
    );
  }
}

Widget _univCard(BuildContext context, String univ_name, int totalRating, String id) {
  return Container(
    width: 400,
    height: 150,
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.only(top: 40, left: 40, right: 40),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.white),
    child: ListTile(
      title: Row(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _starIcon(),
                  _starIcon(),
                  _starIcon(),
                  _starIcon(),
                  _starIcon(),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "${totalRating}",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
      onTap: () {
          // final bloc = BlocProvider.of<SearchBloc>(context);
          // bloc.add(SearchRefresh());
        Navigator.pushNamed(
            context,
            UniversityDetail.routeName,
            arguments: id,
            
          );
      },
    ),
  );
}

Widget _starIcon() {
  return Icon(Icons.star_outline, color: Colors.blueGrey);
}
