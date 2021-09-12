
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:temari_info_flutter/presentation/admin/admin_screen.dart';

void main() {
  testWidgets('Test for add institute', 
  (tester) async{
    await tester.pumpWidget(MaterialApp(home: Admin()));
    final titleFinder=find.text('Admin Page');
    expect (titleFinder, findsWidgets);
  });
  
  }