import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'renter_signup_screen.dart';
import 'welcome_renters.dart';

import 'home.dart';

class RenterSignin extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<RenterSignin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login() async {
    var url = "http://192.168.254.121:8080/apiroomers/renter_login.php";

    var response = await http.post(url, body: {
      "email": email.text,
      "password": password.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 20.0);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomeRenter()));
    } else {
      Fluttertoast.showToast(
          msg: "Username and Password Incorrect",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 20.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(25.0),
            height: height,
            width: width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.teal[700], Colors.teal[50]],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft)),
            child: ListView(
              children: <Widget>[
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => WelcomePage()));
                    },
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/roomers-logo.png',
                            width: 150.0, height: 250.0),
                      ),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Renter Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: "Enter Email",
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'you@example.com',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                      labelText: "Enter password",
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Your password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.teal,
                      child: Text('Sign In'),
                      onPressed: () {
                        login();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RenterSignin()));
                      },
                    )),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Not yet registered?'),
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        'Register',
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RenterSignupScreen()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}
