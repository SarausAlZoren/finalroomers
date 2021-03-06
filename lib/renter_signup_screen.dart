import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'renter_signin_screen.dart';

class RenterSignupScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<RenterSignupScreen> {
  TextEditingController lastname = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController contactnumber = TextEditingController();

  Future register() async {
    var url = "http://192.168.254.121:8080/apiroomers/renter_register.php";
    var response = await http.post(url, body: {
      "lastname": lastname.text,
      "firstname": firstname.text,
      "email": email.text,
      "password": password.text,
      "contactnumber": contactnumber.text,
    });
    var data = json.decode(response.body);
    if (data == "error") {
      Fluttertoast.showToast(
          msg: "This user already exist",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Registered",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RenterSignin()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(children: <Widget>[
        new Container(
          decoration: new BoxDecoration(color: Colors.teal),
        ),
        Positioned(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 10),
                AppBar(
                  toolbarHeight: 30,
                  elevation: 00.0,
                  title: Text(
                    'Renter Registration ',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(height: 40),
                Card(
                  color: Colors.tealAccent[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: lastname,
                              decoration: InputDecoration(
                                labelText: "Enter Lastname",
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Your Lastname',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: firstname,
                              decoration: InputDecoration(
                                labelText: "Enter Firstname",
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Your Firstname',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
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
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              obscureText: true,
                              controller: password,
                              decoration: InputDecoration(
                                labelText: "Enter Password",
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Your Password',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: TextField(
                              controller: contactnumber,
                              decoration: InputDecoration(
                                labelText: "Enter Number",
                                fillColor: Colors.white,
                                filled: true,
                                hintText: '+639*********',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                              width: double.infinity,
                              child: RaisedButton(
                                textColor: Colors.teal,
                                color: Colors.white,
                                child: Text(
                                  'Submit',
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                onPressed: () {
                                  register();
                                },
                              )),
                          Container(
                              child: Row(
                            children: <Widget>[
                              Text('Already have an account?'),
                              FlatButton(
                                textColor: Colors.white,
                                child: Text(
                                  'Sign In',
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RenterSignin()));
                                },
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ))
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
