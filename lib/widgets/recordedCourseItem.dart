import 'package:flutter/material.dart';
import 'package:studentsystem/model/Courses.dart';
import 'package:studentsystem/model/recordedCourses.dart';


class recordedCourseItem extends StatefulWidget {

  Courses recordedCourse;
  recordedCourseItem({this.recordedCourse});

  @override
  _recordedCourseItemState createState() => _recordedCourseItemState();
}

class _recordedCourseItemState extends State<recordedCourseItem> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("\n\n fffff");
    print(widget.recordedCourse.name);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[

        Expanded(
          flex: 1,
          child: Padding(
            child: Text(widget.recordedCourse.code.toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
          ),
        ),
//        Expanded(
//          flex: 2,
//          child: Padding(
//            child: Text("Data Structure",style: TextStyle(color: Colors.white),),
//          ),
//        ),
//        Expanded(
//          flex: 1,
//          child: Padding(
//            child: Text("20",style: TextStyle(color: Colors.white),),
//          ),
//        ),
//
//        Expanded(
//          flex: 1,
//          child: Padding(
//            child: Text("True",style: TextStyle(color: Theme.of(context).accentColor),),
//          ),
//        )

      ],
    );
  }
}
