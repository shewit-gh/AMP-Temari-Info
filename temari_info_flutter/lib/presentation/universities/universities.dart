import 'package:flutter/material.dart';
import 'package:temari_info_flutter/presentation/shared/navBar_Widget.dart';

class Universities extends StatelessWidget {
  static const String routeName = "/universities";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60.0), child: navtop()),


      body: Center(
        child:  SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(25),
              child: Text("Universities", style: TextStyle(color: Colors.teal, fontSize:30,)),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext, index) {
                  return _univCard("Addis Ababa University", 450);
                }),
          ])),
      ),


      drawer: drawer(context),
      bottomNavigationBar: bottomnav(),
    );
  }
}




Widget _univCard(String univ_name, int totalRating) {
  return Container(
      width: 400,
      height: 150,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 40, left: 40, right: 40),
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
      print('tapped');
    },
    ),
   
  );
}


Widget _starIcon() {
  return Icon(
    Icons.star_outline,
    color: Colors.blueGrey
    
  );
}