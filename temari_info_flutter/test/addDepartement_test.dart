
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:temari_info_flutter/presentation/add_department/add_department_screen.dart';

void main() {
  testWidgets('Test for add departemnt', 
  (tester) async{
    await tester.pumpWidget(MaterialApp(home: AddDepartment()));

      final titleFinder=find.text('Name');
      final titleFinder1=find.text('Year');
      final titleFinder2=find.text('Description');
      final textFormField=find.byType(TextFormField);

      expect (titleFinder,findsWidgets);
      expect (titleFinder1,findsWidgets);
      expect (titleFinder2,findsWidgets);
      expect (textFormField,findsWidgets);

  });
  
}
