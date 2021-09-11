
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:temari_info_flutter/presentation/add_inst/add_inst_screen.dart';

void main() {
  testWidgets('Test for add institute', 
  (tester) async{
    await tester.pumpWidget(MaterialApp(home: AddInst()));

      final titleFinder=find.text('Name');
      final titleFinder1=find.text('Phone');
      final titleFinder2=find.text('Email');
      final titleFinder3=find.text('Description');
      final textFormField=find.byType(TextFormField);

      expect (titleFinder,findsWidgets);
      expect (titleFinder1,findsWidgets);
      expect (titleFinder2,findsWidgets);
      expect (titleFinder3,findsWidgets);
      
      expect (textFormField,findsWidgets);

  });
  
}