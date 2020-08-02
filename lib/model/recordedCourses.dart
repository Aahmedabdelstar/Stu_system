import 'package:firebase_database/firebase_database.dart';

class RecordedCourse{

  String RecordedCourseID;
  int courseCode;
  int courseHourseNumbers;
  String courseName;

  int level;

  RecordedCourse({this.courseCode, this.courseName, this.courseHourseNumbers, this.level});
  //Map toJson() => {"title": title, "arabicTitle": arabicTitle};

  RecordedCourse.fromSnapshot(DataSnapshot snap)
      : this.RecordedCourseID = snap.key,
        this.courseCode = snap.value["courseCode"],
        this.courseName = snap.value["courseName"];

  RecordedCourse.fromMap(Map<dynamic, dynamic> value, String key):
        this.RecordedCourseID = key,
        this.courseCode = value["courseCode"],
        this.courseHourseNumbers = value["courseHourseNumbers"],
        this.level = value["level"],
        this.courseName = value["courseName"];





}