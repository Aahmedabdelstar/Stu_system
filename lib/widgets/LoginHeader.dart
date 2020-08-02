import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentsystem/utils/size_config.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: SizeConfig.getResponsiveHeight(150.0),
              decoration: BoxDecoration(
                  color: Color(0XFF21d493),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(SizeConfig.getResponsiveWidth(25.00)),
                      bottomRight: Radius.circular(SizeConfig.getResponsiveWidth(25.0)))),
            ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: Text("Login",
                      style: TextStyle(fontSize: SizeConfig.getResponsiveWidth(25.0), color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            Positioned(
              bottom: SizeConfig.getResponsiveHeight(8),
              left: SizeConfig.getResponsiveWidth(35.0),
              child: Container(
                width: SizeConfig.getResponsiveWidth(300.0),
                height: SizeConfig.getResponsiveHeight(100.0),
                margin: EdgeInsets.only(bottom: SizeConfig.getResponsiveHeight(5.0),top:SizeConfig.getResponsiveHeight(10.0)),
                child: Image.asset(
                  "assets/images/login.png",
                  //color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }
}
