import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class Home extends StatelessWidget {
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: navtop()),
      body:SingleChildScrollView(
        physics: ScrollPhysics(),
        child:Column(children:[
        Container(
          margin: EdgeInsets.all(20),
          child: _search(),),
        
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext, index) {
            return _univCard("Addis Ababa University", 450);
            }),
      ]
      )),
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
        child: TextFormField(
          style: TextStyle(color: Colors.black, fontSize: 14),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            enabledBorder:OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38, width: 1.0),
              borderRadius: BorderRadius.circular(20.0)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.tealAccent, width: 1.0),
              borderRadius: BorderRadius.circular(20.0)
            ),
            icon: Icon(
              Icons.search,
              size: 25,
            ),
            hintText: 'search',
            hintStyle: TextStyle(color: Colors.blueGrey,)),

        ),
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
  return ElevatedButton(
    onPressed: () {}, child: Text('Search'));
}

//university
Widget _univCard(String univ_name, int totalRating) {
  return Container(
    width: 400,
    height: 150,
    padding: EdgeInsets.all(30),
    margin: EdgeInsets.only(top: 40, left: 40, right:40),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.white),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: 100,
            width: 100,
            //add the image here
            // child: Image()
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black)),
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
  );
}

//star icon
Widget _starIcon() {
  return Icon(
    Icons.star,
    color: Colors.yellow,
  );
}
