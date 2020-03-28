import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:bitponic/src/widgets/form_card.dart';
import 'package:bitponic/src/validation/login_validation.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with Validation {
  bool _isSelected = false;
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 0.0),
              child: Image.asset("assets/login_01.png"),
            ),
            Expanded(
              child: Container(),
            ),
            Image.asset("assets/image_02.png")
          ],
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 130.0),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    "assets/logo.png",
                    width: ScreenUtil.getInstance().setWidth(110),
                    height: ScreenUtil.getInstance().setHeight(110),
                  ),
                  Text("bitponic",
                      style: TextStyle(
                          fontFamily: "Poppins-Bold",
                          fontSize: ScreenUtil.getInstance().setSp(46),
                          letterSpacing: .6,
                          fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(40),
              ),
              Container(
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
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Login",
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(45),
                                fontFamily: "Poppins-Bold",
                                letterSpacing: .6)),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(35),
                        ),
                        Text("Email",
                            style: TextStyle(
                                fontFamily: "Poppins-Medium",
                                fontSize: ScreenUtil.getInstance().setSp(26))),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 12.0)),
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
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)
                          ),
                          validator: validatePassword,
                          onSaved: (String value) {
                            password = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 12.0,
                        ),
                        GestureDetector(
                          onTap: _radio,
                          child: radioButton(_isSelected),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text("Remember me",
                            style: TextStyle(
                                fontSize: 12, fontFamily: "Poppins-Medium"))
                      ],
                    ),
                    InkWell(
                      child: Container(
                        width: ScreenUtil.getInstance().setWidth(330),
                        height: ScreenUtil.getInstance().setHeight(100),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                            borderRadius: BorderRadius.circular(6.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFF6078ea).withOpacity(.3),
                                  offset: Offset(0.0, 8.0),
                                  blurRadius: 8.0)
                            ]),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();
                                print('Email: $email');
                                print('Password: $password');
                              }
                            },
                            child: Center(
                              child: Text("MASUK",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins-Bold",
                                      fontSize: 18,
                                      letterSpacing: 1.0)),
                            ),
                          ),
                        ),
                      ),
                    )
                  ])
            ]),
          ),
        ),
      ]),
    );
  }
}
