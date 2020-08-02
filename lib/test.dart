import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:studentsystem/model/recordedCourses.dart';
import 'package:studentsystem/widgets/recordedCourseItem.dart';



class HomePage2 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    ///- to determine width and height of screen
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("HomePage",style: TextStyle(color: Theme.of(context).accentColor),),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[

          SizedBox(height: 20,),

          ///Student Name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text("Student Name : ",style: TextStyle(color: Colors.white,fontSize: 15),),
                  width: screenWidth*.3,
                ),
                Container(
                  width: screenWidth*.63,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(
                          width: 1,
                          color: Colors.white
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(child: Text("Ahmed abdelstar abdelaziz",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),)),
                  ),
                )


              ],
            ),
          ),

          /// Student Code
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text("Student Code : ",style: TextStyle(color: Colors.white,fontSize: 15),),
                  width: screenWidth*.3,
                ),
                Container(
                  width: screenWidth*.63,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(
                          width: 1,
                          color: Colors.white
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(child: Text("1",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),)),
                  ),
                )


              ],
            ),
          ),

          ///Student - National ID
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text("National ID : ",style: TextStyle(color: Colors.white,fontSize: 15),),
                  width: screenWidth*.3,
                ),
                Container(
                  width: screenWidth*.63,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(
                          width: 1,
                          color: Colors.white
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(child: Text("01234567891234",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),)),
                  ),
                )


              ],
            ),
          ),

          /// Student section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text("Student Section : ",style: TextStyle(color: Colors.white,fontSize: 15),),
                  width: screenWidth*.3,
                ),
                Container(
                  width: screenWidth*.63,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(
                          width: 1,
                          color: Colors.white
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(child: Text("CS",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),)),
                  ),
                )


              ],
            ),
          ),

          ///Student - Academic year
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text("Academic Year : ",style: TextStyle(color: Colors.white,fontSize: 15),),
                  width: screenWidth*.3,
                ),
                Container(
                  width: screenWidth*.63,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(
                          width: 1,
                          color: Colors.white
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(child: Text("2020-2021",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),)),
                  ),
                )


              ],
            ),
          ),

          /// Student  - Minimum registration
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text("Minimum Registration : ",style: TextStyle(color: Colors.white,fontSize: 15),),
                  width: screenWidth*.3,
                ),
                Container(
                  width: screenWidth*.63,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(
                          width: 1,
                          color: Colors.white
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(child: Text("9 Hours",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),)),
                  ),
                )


              ],
            ),
          ),

          /// Student  - Maximum registration
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text("Maximum Registration : ",style: TextStyle(color: Colors.white,fontSize: 15),),
                  width: screenWidth*.3,
                ),
                Container(
                  width: screenWidth*.63,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(
                          width: 1,
                          color: Colors.white
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(child: Text("9 Hours",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),)),
                  ),
                )


              ],
            ),
          ),


          /// Student  - Done registration
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text("Done   Registration : ",style: TextStyle(color: Colors.white,fontSize: 15),),
                  width: screenWidth*.3,
                ),
                Container(
                  width: screenWidth*.63,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(
                          width: 1,
                          color: Colors.white
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(child: Text("9 Hours",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 20),)),
                  ),
                )


              ],
            ),
          ),

          ///-  Recorded courses
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Recorded Courses",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          ),

          ///- Horsiontal Line
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: screenWidth,
              height: 1,
              color: Colors.white,
            ),
          ),


//          /// Recorded courses Data
//          Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: ListView.builder(
//                itemCount: recordedCoursesForStudent.length,
//                itemBuilder: (context , index){
//                  recordedCourseItem(recordedCourse: recordedCoursesForStudent[index],);
//                },
//              )
//          ),
//
//          ///--


        ],
      ),
    );
  }
}




