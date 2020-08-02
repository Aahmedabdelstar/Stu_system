import 'package:firebase_database/firebase_database.dart';

class Courses{

  String CourseID;
  String code;
  String courselevel;
  String hourNumbers;
  String name;


  Courses({this.CourseID, this.code, this.courselevel, this.hourNumbers,this.name});

  Courses.fromSnapshot(DataSnapshot snap)
      : this.CourseID = snap.key,
        this.code = snap.value["code"],
        this.courselevel = snap.value["courselevel"],
        this.hourNumbers = snap.value["hourNumbers"],
        this.name = snap.value["name"];

  Courses.fromMap(Map<dynamic, dynamic> value, String key):
        this.CourseID = key,
        this.code = value["code"],
        this.courselevel = value["courselevel"],
        this.hourNumbers = value["hourNumbers"],
        this.name = value["name"];





}