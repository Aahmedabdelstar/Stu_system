import 'package:flutter/material.dart';
import 'package:studentsystem/addNewStudent.dart';
import 'package:studentsystem/screens/HomePage.dart';
import 'package:studentsystem/screens/LoginScreen.dart';

import 'addNewCourse.dart';
import 'addNewStudent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      //home: AddNewCourse(),
      //home: AddNewStudent(),
      theme: ThemeData(
        primaryColor: Color(0xff263341),
        accentColor: Color(0xff8DB646),
      ),
    );
  }
}
