import 'package:firebase_database/firebase_database.dart';

class Student{

  String StudentID;
  String email;
  String level;
  String name;
  String nationalID;
  String password;


  Student({this.StudentID,this.email, this.level, this.name, this.nationalID,this.password});

  Student.fromSnapshot(DataSnapshot snap)
      : this.StudentID = snap.key,
        this.email = snap.value["email"],
        this.level = snap.value["level"],
        this.name = snap.value["name"],
        this.nationalID = snap.value["nationalID"],
        this.password = snap.value["password"];

  Student.fromMap(Map<dynamic, dynamic> value, String key):
        this.StudentID = key,
        this.email = value["email"],
        this.level = value["level"],
        this.name = value["name"],
        this.nationalID = value["nationalID"],
        this.password = value["password"];





}