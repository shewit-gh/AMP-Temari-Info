import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';
import 'package:temari_info_flutter/rating/blocs/rating_bloc.dart';
import 'package:temari_info_flutter/rating/blocs/rating_event.dart';
import 'package:temari_info_flutter/rating/blocs/rating_state.dart';
import 'package:temari_info_flutter/rating/data_provider/rating_data.dart';
import 'package:temari_info_flutter/rating/models/models.dart';
import 'package:temari_info_flutter/rating/repo/rating_repo.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60.0), child: navtop()),
      body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(20),
              child: _search(),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext, index) {
                  return _univCard("Addis Ababa University", 450);
                }),
          ])),
      drawer: drawer(context),
      bottomNavigationBar: bottomnav(),
    );
  }
}

//search widget
Widget _search() {
  return Row(
    //arrange the alignment
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 300,
        height: 40,
        margin: EdgeInsets.only(bottom: 50, top: 10),
        child: Form(
            child: TextFormField(
          style: TextStyle(color: Colors.black, fontSize: 14),
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38, width: 1.0),
                  borderRadius: BorderRadius.circular(20.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 1.0),
                  borderRadius: BorderRadius.circular(20.0)),
              icon: Icon(
                Icons.search,
                size: 25,
              ),
              hintText: 'search',
              hintStyle: TextStyle(
                color: Colors.blueGrey,
              )),
        )),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 40),
        child: _searchButton(),
      ),
    ],
  );
}

//search button
Widget _searchButton() {
  return ElevatedButton(onPressed: () {}, child: Text('Search'));
}

final RatingRepo _ratingRepo =
    RatingRepo(dataProvider: RatingDataProvider(httpClient: http.Client()));
//university
Widget _univCard(String univ_name, int totalRating) {
  final RatingBloc ratingBloc = RatingBloc(_ratingRepo);

  return BlocBuilder<RatingBloc, RatingState>(
      bloc: ratingBloc,
      builder: (context, state) {
        return Container(
          width: 400,
          height: 150,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 40, left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: ListTile(title: Row(
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
                      Container(
                        child: state is LoadingState ? CircularProgressIndicator() : BlocBuilder<RatingBloc, RatingState>(
                          builder: (context, state) => RatingBar.builder(
                            itemSize: 20,
                            
                               initialRating: (state is UpdateSuccess) ? state.rating.toDouble() : 1,
                               minRating: 0,
                               direction: Axis.horizontal,
                               allowHalfRating: false,
                               itemCount: 5,
                               itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                               itemBuilder: (context, _) => Icon(
                                 Icons.star,
                                 size: 8,
                                 color: Colors.amber,
                               ),
                               unratedColor: Colors.black,
                               onRatingUpdate: (rating) {
                                ratingBloc.add(AddRating(Rating(id: '61391ec0968b715656c208b5', rating: rating.toInt(), university_id: '61391ec0968b715656c208b5', user_id: '61392336968b715656c208b9')));
                               }
                          ),
                        ),
                      ),
                     
                      state is AddingRatingSuccess ? Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "${totalRating++}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ) : Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "${totalRating}",
                          style: TextStyle(color: Colors.black),
                        ),
                        state is AddingRatingSuccess
                            ? Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "${totalRating++}",
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            : Container(
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
              print('tapped');
            },
          ),
        );
      });
}

//star icon
Widget _starIcon() {
  return Icon(Icons.star_outline, color: Colors.blueGrey);
}
