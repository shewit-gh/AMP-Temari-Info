import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class Home extends StatelessWidget {
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: navtop()),
      body:SingleChildScrollView(
        physics: ScrollPhysics(),
        child:Column(children:[
        Container(
          margin: EdgeInsets.all(40),
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
  
    //     body: Stack(
    //       children: [
    //         NavBar(),
    //         // Center(
    //         //   child: _search()
    //         // )
    //         Positioned(
    //             top: 100,
    //             child: Expanded(
    //                 child: Column(
    //                 children: [
    //                   _search(),
    //                   ListView.builder(
    //                     itemCount: 5,
    //                     itemBuilder: (BuildContext, index) {
    //                       return _univCard("Addis Ababa University", 450);
    //                       })
    //                 ],
    //                 // _univCard("Addis Ababa University", 450)],
    //               ),
    //             ))
    //       ],
    // )
    
  }
}

//search widget
Widget _search() {
  return Row(
    //arrange the alignment
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        width: 300,
        height: 40,
        margin: EdgeInsets.only(bottom: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: TextFormField(
          decoration: InputDecoration(
              //make the input line invisible
              icon: Icon(
                Icons.search,
                size: 20,
              ),
              hintText: 'search',
              hintStyle: TextStyle(color: Colors.blueGrey)),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 30, bottom: 50),
        child: _searchButton(),
      ),
    ],
  );
}

//search button
Widget _searchButton() {
  return ElevatedButton(onPressed: () {}, child: Text('Search'));
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
