import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:graphql/client.dart';
import 'data.dart';
import 'package:RAISE/colorFile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> with ColorFile {
  double width = double.maxFinite;
  int stateBut = 0;
  int authBut = 0;

  Widget authManager() {
    switch (authBut) {
      case 0:
        {
          return login();
        }

        break;
      case 1:
        {
          return register();
        }

        break;
      default:
        {
          return login();
        }
    }
  }

  Widget login() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [
              Container(
                child: TextLiquidFill(
                  waveDuration: Duration(seconds: 1),
                  loadDuration: Duration(seconds: 7),
                  text: 'RAISE',
                  waveColor: white,
                  boxBackgroundColor: deepBrown,
                  textStyle: GoogleFonts.raleway(
                    textStyle: TextStyle(
                      fontSize: 63.0,
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  boxHeight: 120.0,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: TextField(
                  onChanged: (val) {
                    email = val;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(FontAwesomeIcons.userAlt),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  style: TextStyle(fontSize: 17, color: white),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: TextField(
                  onChanged: (val) {
                    password = val;
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    prefixIcon: Icon(FontAwesomeIcons.lock),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  style: TextStyle(fontSize: 17, color: white),
                ),
              ),
              Container(
                  width: width,
                  height: 60,
                  margin: EdgeInsets.fromLTRB(20, 5, 20, 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: RaisedButton(
                      onPressed: () async {
                        stateBut = 1;
                        setState(() {});
                        int temp = await getToken();
                        int temp2 = await getProfile();

                        if (temp == 1 && temp2 == 1) {
                          Timer(Duration(seconds: 2), () {
                            stateBut = 2;
                            setState(() {});
                          });
                          Timer(Duration(seconds: 3), () {
                            Navigator.pushNamed(context, "/dash");
                          });
                        } else {
                          Timer(Duration(seconds: 2), () {
                            stateBut = 3;
                            setState(() {});
                          });
                          Timer(Duration(seconds: 4), () {
                            stateBut = 0;
                            setState(() {});
                          });
                        }
                      },
                      color: deepPink,
                      textColor: white,
                      padding: EdgeInsets.all(10),
                      splashColor: lightPink,
                      child: logChild(),
                    ),
                  )),
            ]),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              width: double.maxFinite,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not having an Account?",
                    style: TextStyle(fontSize: 20, color: white),
                  ),
                  SizedBox(width: 10),
                  Hero(
                    tag: "back_next",
                    child: IconButton(
                        padding: EdgeInsets.all(5),
                        color: white,
                        splashColor: lightPink,
                        iconSize: 40,
                        icon: Icon(FontAwesomeIcons.arrowAltCircleRight),
                        onPressed: () {
                          setState(() {
                            authBut = 1;
                          });
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget logChild() {
    switch (stateBut) {
      case 0:
        {
          return Text(
            "Login",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          );
        }
        break;
      case 1:
        {
          return SpinKitDoubleBounce(
            color: Colors.white,
            size: 50.0,
          );
        }
        break;
      case 2:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.checkCircle),
              SizedBox(
                width: 7,
              ),
              Text(
                "Success!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          );
        }
        break;
      case 3:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.timesCircle),
              SizedBox(
                width: 7,
              ),
              Text(
                "Check Credentials",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          );
        }
        break;
      default:
        {
          return Text(
            "LogIn",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          );
        }
    }
  }

  Widget regChild() {
    switch (stateBut) {
      case 0:
        {
          return Text(
            "Create Account",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          );
        }
        break;
      case 1:
        {
          return SpinKitDoubleBounce(
            color: Colors.white,
            size: 50.0,
          );
        }
        break;
      case 2:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.checkCircle),
              SizedBox(
                width: 7,
              ),
              Text(
                "Success!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          );
        }
        break;
      case 3:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.timesCircle),
              SizedBox(
                width: 7,
              ),
              Text(
                "Check Credentials",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          );
        }
        break;
      default:
        {
          return Text(
            "Create Account",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          );
        }
    }
  }

  Widget register() {
    void validate() {
      pass = password;
      if (pass.length > 6) {
        minChar = true;
      } else {
        minChar = false;
      }
      if (pass.contains(new RegExp(r'[A-Z]'))) {
        upperCase = true;
      } else {
        upperCase = false;
      }
      if (pass.contains(new RegExp(r'[a-z]'))) {
        lowerCase = true;
      } else {
        lowerCase = false;
      }
      if (pass.contains(new RegExp(r'[0-9]'))) {
        number = true;
      } else {
        number = false;
      }
      setState(() {});
    }

    Widget lowerNum() {
      if (lowerCase == true) {
        // print("yes working");
        return CheckIcon();
      } else {
        // print("not working");
        return MyBullet();
      }
    }

    Widget capsNum() {
      if (upperCase == true) {
        // print("yes working");
        return CheckIcon();
      } else {
        // print("not working");
        return MyBullet();
      }
    }

    Widget minNum() {
      if (minChar == true) {
        // print("yes working");
        return CheckIcon();
      } else {
        // print("not working");
        return MyBullet();
      }
    }

    Widget oneNum() {
      if (number == true) {
        // print("yes working");
        return CheckIcon();
      } else {
        // print("not working");
        return MyBullet();
      }
    }

    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Hero(
                tag: "back_next",
                child: IconButton(
                  splashColor: lightPink,
                  color: white,
                  iconSize: 40,
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    setState(() {
                      authBut = 0;
                    });
                  },
                ),
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Text(
                  "Hi there!",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Text(
                  "Please enter the following details to create a free account",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(fontSize: 20, color: white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: TextField(
                  onChanged: (val) {
                    email = val;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(FontAwesomeIcons.userAlt),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  style: TextStyle(fontSize: 17, color: white),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: TextField(
                  onChanged: (val) {
                    password = val;

                    validate();
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    prefixIcon: Icon(FontAwesomeIcons.lock),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  style: TextStyle(fontSize: 17, color: white),
                ),
              ),
              Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            lowerNum(),
                            SizedBox(width: 10),
                            Text(
                              "Lower-case",
                              style: GoogleFonts.lato(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            capsNum(),
                            SizedBox(width: 10),
                            Text(
                              "Upper-case",
                              style: GoogleFonts.lato(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            oneNum(),
                            SizedBox(width: 10),
                            Text(
                              "Number",
                              style: GoogleFonts.lato(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            minNum(),
                            SizedBox(width: 10),
                            Text(
                              "More than 6 characters",
                              style: GoogleFonts.lato(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(25, 5, 20, 10)),
              Container(
                  width: width,
                  height: 60,
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: RaisedButton(
                      onPressed: () async {
                        stateBut = 1;
                        setState(() {});
                        // int tok = await getToken();
                        int temp = await createUser();

                        if (temp == 1) {
                          Timer(Duration(seconds: 2), () {
                            stateBut = 2;
                            setState(() {});
                          });
                          Timer(Duration(seconds: 3), () {
                            Navigator.pushReplacementNamed(
                                context, "/createProfile");
                          });
                        } else {
                          Timer(Duration(seconds: 2), () {
                            stateBut = 3;
                            setState(() {});
                          });
                          Timer(Duration(seconds: 4), () {
                            stateBut = 0;
                            setState(() {});
                          });
                        }
                      },
                      color: deepPink,
                      textColor: white,
                      padding: EdgeInsets.all(10),
                      splashColor: lightPink,
                      child: regChild(),
                    ),
                  )),
            ]),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deepBrown,
      body: SafeArea(
        child: Center(child: authManager()),
      ),
    );
  }
}

class MyBullet extends StatelessWidget with ColorFile {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 14.0,
      width: 14.0,
      decoration: new BoxDecoration(
        color: deepPink,
        shape: BoxShape.circle,
      ),
    );
  }
}

class CheckIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Icon(Icons.check, size: 14, color: Colors.white),
    );
  }
}
