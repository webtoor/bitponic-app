/* import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bitponic/src/validator/login_validator.dart';

class FormCard extends StatefulWidget {
  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> with Validation {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(500),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
    child: Form(

      key: formKey,
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Login",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("Email",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              validator: validateEmail,
              onSaved: (String value) {
                email = value;
              },
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("Password",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              validator: validatePassword,
              onSaved: (String value) {
                password = value;
              },
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Lupa Password?",
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(28)),
                )
              ],
            )
          ],
        ),
      ),
    ),
    );
  }
}
*/