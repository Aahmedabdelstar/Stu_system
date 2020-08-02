
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AddNewStudent extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _AddNewStudent();
}

class _AddNewStudent extends State<AddNewStudent> {


  final formKey = new GlobalKey<FormState>( );
  String username, email, password, confirmPassword, nationalID,level;
  var _isLoading = false;
  String userId;


  FirebaseDatabase _database = FirebaseDatabase.instance;

  // to show message in error statu
  void _showErrorDialog(String message) {
    showDialog (
      context: this.context,
      builder: (ctx) =>
          AlertDialog (
            title: Text ( "SignInPage.DialogText" ),
            content: Text ( message ),
            actions: <Widget>[
              FlatButton (
                child: Text ( "SignInPage.DialogButton" ),
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

    if (password != confirmPassword)
      {
        print("\n\n aaaaaaaaaaa");
        _showErrorDialog("err");
        return false;
      }
    else
      {
        print("\n\n bbbbbbbbbb");
        if (form.validate ( )) {
          form.save ( );
          return true;
        } else {
          return false;
        }
      }
  }

  void validateAndSubmit() async {
    setState ( () {
      _isLoading = true;
    } );

    print("\n\n");
    print(validateAndSave ( ));
    if (validateAndSave ( )) {

      FirebaseUser user = (await FirebaseAuth.instance
          .createUserWithEmailAndPassword (
          email: email, password: password )).user;

      if (user.uid != null) {
        ////- from move to another screen
        //// update new customer informations mu adding Phone number

        _database.reference ( ).child ( "Students" ).child ( user.uid )
            .set ( {
          "email": email,
          "isBlocked": false,
          "name": username,
          "password":password,
          "nationalID":nationalID,
          "level":level

        } );


        await FirebaseAuth.instance.signInWithEmailAndPassword (
            email: email, password: password );


//          Navigator.pushReplacement (
//              context, MaterialPageRoute ( builder: (context) =>
//              HomePage (
//                screen: Store ( ), auth: widget.auth,
//                onSignedOut: widget.onSignedIn,
//              ) ) );
      }
      //widget.onSignedIn;
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
      appBar: AppBar(title: Text("Add New Student"),centerTitle: true,),
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
                            if (value.isEmpty || value.length < 4) {
                              return "Invalid username";
                            }
                          },
                          onSaved: (value) => username = value,


                          decoration: new InputDecoration(
                            labelText: "username!",labelStyle: TextStyle(color: Colors.white),

                            prefixIcon: Icon (
                              Icons.person, color: Theme.of(context).accentColor, ),
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
                          keyboardType: TextInputType.emailAddress,style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value.isEmpty || !value.contains ( '@' )) {
                              return "Invalid Email";
                            }
                          },
                          onSaved: (value) => email = value,
                          decoration: new InputDecoration(
                            labelText: "Email",labelStyle: TextStyle(color: Colors.white),

                            prefixIcon: Icon (
                              Icons.email, color: Theme.of(context).accentColor, ),
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
                            if (value.isEmpty || value.length!=14 ) {
                              return "Invalid National ID";
                            }
                          },
                          onSaved: (value) => nationalID = value,
                          decoration: new InputDecoration(
                            labelText: "National ID",labelStyle: TextStyle(color: Colors.white),

                            prefixIcon: Icon (
                              Icons.payment, color: Theme.of(context).accentColor, ),
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
                              return "Invalid Level";
                            }
                          },
                          onSaved: (value) => level = value,
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


                      Padding (
                        padding: const EdgeInsets.only(
                            top: 20.0, right: 25, left: 25 ),
                        child: TextFormField (
                          keyboardType: TextInputType.text,style: TextStyle(color: Colors.white),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty || value.length < 6) {
                              return "Invalid Password";
                            }
                          },
                          onSaved: (value) => password = value,
                          onChanged: (value) => password = value,

                          //controller: passtextFieldController,

                          decoration: new InputDecoration(
                            labelText: "Password",labelStyle: TextStyle(color: Colors.white),

                            prefixIcon: Icon (
                              Icons.lock, color: Theme.of(context).accentColor, ),
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
                          keyboardType: TextInputType.text,style: TextStyle(color: Colors.white),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty)
                              return 'Empty';
                            if(value!=password.toString())
                              {
                                return "error1";
                              }

                          },
                          onChanged: (value) => confirmPassword = value,
                          onSaved: (value) => confirmPassword = value,
                          //controller: _textFieldController,

                          decoration: new InputDecoration(
                            labelText: "Confirm Password",labelStyle: TextStyle(color: Colors.white),

                            prefixIcon: Icon (
                              Icons.lock, color: Theme.of(context).accentColor, ),
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
                          "Add New Student",
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


