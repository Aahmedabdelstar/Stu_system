import 'package:firebase_database/firebase_database.dart';
import 'package:studentsystem/model/Student.dart';
import 'package:studentsystem/utils/size_config.dart';
import 'package:studentsystem/widgets/LoginHeader.dart';
import '../test.dart';
//import 'HomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login>{
  final formKey = new GlobalKey<FormState>();
  String email,password;
  var _isLoading = false;
  var delivaryMenID;

  authenticatedFromSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    delivaryMenID = prefs.getString('delivaryMenID');

    if(delivaryMenID != null)
      {
        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=>HomePage2()));
      }

  }
  @override
  void initState() {
    super.initState();

    authenticatedFromSharedPreference();


  }

  // to show message in error statu
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("ERROR"),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }



  bool authenticatedDelivary = false;
  Student ThatStudent;
  FirebaseDatabase _database = FirebaseDatabase.instance;
  List<Student> StudentList = <Student>[];

//  getAllStudents() async{
//    StudentList.clear();
//    // get the Students
//    await _database.reference().child("Students").once().then((DataSnapshot snapshot) {
//      Map<dynamic, dynamic> productsMap = snapshot.value;
//      productsMap.forEach((key, value) async{
//        Student p = Student.fromMap(value , key);
//        StudentList.add(p);
//      });
//    }).then((v) {
//      if (mounted) setState(() {});
//    });
//
//
//  }

  bool validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }else
      return false;
  }
  Future<void> validateAndSubmit() async {
    setState(() {
      _isLoading = true;
    });

    if(validateAndSave())
      {
        print("\n\n\n 11 : "+email);
        print("\n 11 : "+password);

        // get the products
        await _database.reference().child("Students").once().then((DataSnapshot snapshot) {
          Map<dynamic, dynamic> productsMap = snapshot.value;
          productsMap.forEach((key, value) async{
            Student p = Student.fromMap(value , key);
            StudentList.add(p);
          });
        }).whenComplete(() async{
          for(int i = 0 ; i < StudentList.length;i++)
          {
            print("\n\n 11 : "+StudentList[i].email);
            print("\n 11 : "+StudentList[i].password);
            if(StudentList[i].email == email && StudentList[i].password == password)
            {
              authenticatedDelivary=true;
              ThatStudent = StudentList[i];

              ////- Save Authentiaction to ShaderPerference
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('StudentID', ThatStudent.StudentID);
            }

          }

          if(authenticatedDelivary)
          {
            Navigator.pushReplacement (
                context,
                new MaterialPageRoute( builder: (context) => HomePage2 () )
            );
          }
          else
          {
            String errorMessage =
                'there are mistake in email or password. Please try again later.';
            _showErrorDialog(errorMessage);

          }

          setState(() {
            _isLoading = false;
          });

        });




      }

  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Stack(children: <Widget>[
              new ListView(
                children: <Widget>[
                  LoginHeader(),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Card(
                          margin: EdgeInsets.all(30.0),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Login",
                              style: TextStyle(
                                  fontSize: SizeConfig.getResponsiveWidth(15.0),
                                  color: Colors.grey,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, right: 25, left: 25),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty ) {
                                return 'Invalid email!';
                              }
                            },
                            onSaved: (value) => email= value,
                            //controller: _textFieldController,

                            decoration: new InputDecoration(
                              labelText: "Email",

                              prefixIcon:  Icon (
                                Icons.email, color: Theme.of(context).accentColor, ),

                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, right: 25, left: 25),
                          child: TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty || value.length < 5) {
                                return 'Password is too short!';
                              }
                            },
                            onSaved: (value) =>password=value,
                            decoration: new InputDecoration(
                              prefixIcon:  Icon (
                                Icons.lock, color: Theme.of(context).accentColor, ),

                              labelText: "Password",
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        _isLoading?
                          CircularProgressIndicator()
                        :
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0, right: 25, left: 25),
                            child:Container(
                              width: 300,
                              height: 50,
                              child: RaisedButton(
                                onPressed: (){
                                  validateAndSubmit();
                                },
                                color: Color(0XFF21d493),
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                                child: Text("Login",
                                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        );
      });
    });
  }



}


