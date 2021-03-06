import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:bitponic/src/screens/dashboard.dart';
import 'package:bitponic/src/blocs/auth_bloc.dart';
import 'package:bitponic/src/models/auth_response.dart';

final bloc = AuthBloc();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isSelected = false;
  //final LocalStorage storage = new LocalStorage('user_app');
  //final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String email = '';
  String password = '';

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  /* void submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();

      /* print('Printing the login data.');
      print('Email : $email');
      print('Password : $password'); */

      //this.postLogin();
      dashboardPage();
    }
  } */

  void dashboardPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => Dashboard()));
  }

  /*Future postLogin() async {
    var url = "http://192.168.1.4:8000/api/v1/login";
    var body = json.encode({
      "email": '$email',
      "password": '$password',
    });

    await http.post(url, body: body, headers: {
      "content-type": "application/json",
      "accept": "application/json",
    }).then((response) {
      print("Response status: ${response.statusCode}");

      Map extractdata = json.decode(response.body);
      //print(extractdata);
      storage.setItem('user_bitponic', (extractdata));
      var apps = storage.getItem('user_bitponic');
      print(apps);
      if (extractdata['access_token'] != null) {
        //print(extractdata['access_token']);
        dashboardPage();
      } else if (extractdata['error'] != null) {
        //print(extractdata['error']);
        showSnackBar();
      }
    });
  } */
  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  void showErrorMessage(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void showSnackBar() {
    final snackBarContent = SnackBar(
      content: Text(
          'Anda memasukkan Username/Email dan Password yang salah. Isi dengan data yang benar dan coba lagi'),
      action: SnackBarAction(
          label: 'OK',
          onPressed: _scaffoldKey.currentState.hideCurrentSnackBar),
    );
    _scaffoldKey.currentState.showSnackBar(snackBarContent);
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
  // Loading Widget
  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Loading data from API...", textDirection: TextDirection.ltr),
          CircularProgressIndicator()
        ],
      ),
    );
  }

  Widget message() {
    return StreamBuilder<LoginState>(
      stream: bloc.loginStateStream,
      builder: (context, AsyncSnapshot<LoginState> snapshot) {
        if (!snapshot.hasData) return Container();

        switch (snapshot.data.status) {
          case LoginStatus.LOGGING:
            return _buildLoadingWidget();

          case LoginStatus.LOGIN_ERROR:
            WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBar());
            return Container();

          case LoginStatus.LOGIN_SUCCESS:
            // Here you can go to another screen after login success.
            WidgetsBinding.instance
                .addPostFrameCallback((_) => dashboardPage());
            return Container();

          case LoginStatus.NON_LOGIN:
          default:
            return Container();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      key: _scaffoldKey,
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
                  //key: formKey,
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
                        emailField(bloc),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Text("Password",
                            style: TextStyle(
                                fontFamily: "Poppins-Medium",
                                fontSize: ScreenUtil.getInstance().setSp(26))),
                        passwordField(bloc),
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
                    submitField(bloc),
                  ])
            ]),
          ),
        ),
        message()
      ]),
    );
  }

  Widget emailField(bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget passwordField(bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitField(bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return InkWell(
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
                  onTap: snapshot.hasData ? bloc.submit : null,
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
          );
        });
  }
}
