import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:studentsystem/model/Courses.dart';
import 'package:studentsystem/model/recordedCourses.dart';
import 'package:studentsystem/widgets/recordedCourseItem.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ///to display data from firebase
  List<Courses> recordedCoursesForStudent = <Courses>[];
  FirebaseDatabase _database = FirebaseDatabase.instance;

  ///- method get data from firebase
  getAllRecordedCourses() async {
    //recordedCoursesForStudent.clear();
    await _database
        .reference()
        .child("Courses")
        .once()
        .then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> courses = snapshot.value;
      courses.forEach((key, value) async {
        Courses nextCategories = Courses.fromMap(value, key);

        recordedCoursesForStudent.add(nextCategories);
        print("\n\n"+recordedCoursesForStudent[0].name);
      });
    }).then((e) {
      if (mounted) {
        setState(() {});
      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllRecordedCourses();
    print("count"+recordedCoursesForStudent.length.toString());

  }


  @override
  Widget build(BuildContext context) {

    ///- to determine width and height of screen
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(recordedCoursesForStudent[0].name,style: TextStyle(color: Theme.of(context).accentColor),),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: recordedCoursesForStudent.length,
        itemBuilder: (context , index){
          recordedCourseItem(recordedCourse: recordedCoursesForStudent.elementAt(index));
        },
      ),
    );
  }
}
