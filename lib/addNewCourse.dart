
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AddNewCourse extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _AddNewCourse();
}

class _AddNewCourse extends State<AddNewCourse> {


  final formKey = new GlobalKey<FormState>( );
  String coursename , courseCode,hourNumbers,courselevel;
  var _isLoading = false;
  //String userId;


  FirebaseDatabase _database = FirebaseDatabase.instance;

  // to show message in error statu
  void _showErrorDialog(String title, String message) {
    showDialog (
      context: this.context,
      builder: (ctx) =>
          AlertDialog (
            title: Text ( title ),
            content: Text ( message ),
            actions: <Widget>[
              FlatButton (
                child: Text ( "OK" ),
                onPressed: () {
                  Navigator.of ( ctx ).pop ( );
                },
              )
            ],
          ),
    );
  }

  bool validateAndSave() {
    final form = formKey.currentState;
        print("\n\n bbbbbbbbbb");
        if (form.validate ( )) {
          form.save ( );
          return true;
        } else {
          return false;
        }

  }

  void validateAndSubmit() async {
    setState ( () {
      _isLoading = true;
    } );

    print("\n\n");
    print(validateAndSave ( ));
    if (validateAndSave ( )) {

      String CourseID = _database.reference()
          .child("Courses")
          .push().key;

        _database.reference ( ).child ( "Courses" ).child(CourseID)
            .set ( {
          "code":courseCode,
          "name": coursename,
          "hourNumbers":hourNumbers,
          "courselevel":courselevel

        } );

        _showErrorDialog("Done","New Course has been added");

    }

  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState> ( );
    final TextEditingController passtextFieldController = TextEditingController ( );

    ///- clculate size of width and height of mobile screen
    /// put all widget byProportion and fit with size of mobile to be responsive with all screens
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;


    return Scaffold (
      appBar: AppBar(title: Text("Add New Course"),centerTitle: true,),
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView (
        children: <Widget>[
          Stack (
              children: <Widget>[
                Form (
                  key: formKey,
                  child: new ListView(
                    shrinkWrap: true,
                    children: <Widget>[


                      Padding (
                        padding: const EdgeInsets.only(
                            top: 20.0, right: 25, left: 25 ),
                        child: TextFormField (
                          keyboardType: TextInputType.text,style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value.isEmpty || value.length < 2) {
                              return "Invalid courseName";
                            }
                          },
                          onSaved: (value) => coursename = value,


                          decoration: new InputDecoration(
                            labelText: "courseame!",labelStyle: TextStyle(color: Colors.white),

                            prefixIcon: Icon (
                              Icons.book, color: Theme.of(context).accentColor, ),
                            //labelText: AppLocalizations.of(context).categoryNameFruite,
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all ( Radius.circular ( 15.0 ) ),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder (
                              borderRadius:
                              BorderRadius.all ( Radius.circular ( 15.0 ) ),
                              borderSide: BorderSide ( color: Colors.blue ),
                            ),
                          ),
                        ),

                      ),
                      Padding (
                        padding: const EdgeInsets.only(
                            top: 20.0, right: 25, left: 25 ),
                        child: TextFormField (

                          keyboardType: TextInputType.number,style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value.isEmpty ) {
                              return "Invalid Course Code";
                            }
                          },
                          onSaved: (value) => courseCode = value,
                          decoration: new InputDecoration(
                            labelText: "Course Code",labelStyle: TextStyle(color: Colors.white),

                            prefixIcon: Icon (
                              Icons.vpn_key, color: Theme.of(context).accentColor, ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all ( Radius.circular ( 15.0 ) ),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder (
                              borderRadius:
                              BorderRadius.all ( Radius.circular ( 15.0 ) ),
                              borderSide: BorderSide ( color: Colors.blue ),
                            ),
                          ),
                        ),
                      ),
                      Padding (
                        padding: const EdgeInsets.only(
                            top: 20.0, right: 25, left: 25 ),
                        child: TextFormField (
                          keyboardType: TextInputType.number,style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value.isEmpty  ) {
                              return "Invalid hours Numbers";
                            }
                          },
                          onSaved: (value) => hourNumbers = value,
                          decoration: new InputDecoration(
                            labelText: "hours Numbers",labelStyle: TextStyle(color: Colors.white),

                            prefixIcon: Icon (
                              Icons.timer, color: Theme.of(context).accentColor, ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all ( Radius.circular ( 15.0 ) ),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder (
                              borderRadius:
                              BorderRadius.all ( Radius.circular ( 15.0 ) ),
                              borderSide: BorderSide ( color: Colors.blue ),
                            ),
                          ),
                        ),
                      ),

                      Padding (
                        padding: const EdgeInsets.only(
                            top: 20.0, right: 25, left: 25 ),
                        child: TextFormField (
                          keyboardType: TextInputType.number,style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value.isEmpty || value.length!=1) {
                              return "Invalid Course level";
                            }
                          },
                          onSaved: (value) => courselevel = value,
                          decoration: new InputDecoration(
                            labelText: "Level",labelStyle: TextStyle(color: Colors.white),

                            prefixIcon: Icon (
                              Icons.trending_up, color: Theme.of(context).accentColor, ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all ( Radius.circular ( 15.0 ) ),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder (
                              borderRadius:
                              BorderRadius.all ( Radius.circular ( 15.0 ) ),
                              borderSide: BorderSide ( color: Colors.blue ),
                            ),
                          ),
                        ),
                      ),




                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top:screenheight*.78),
                  child: Center(
                    child: Container(
                      width: screenWidth * .7,
                      height: 40,
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          validateAndSubmit ( );
                        },
                        child: Text(
                          "Add New Course",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )



              ] ),
        ],
      ),
    );
  }
}


