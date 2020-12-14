import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'welcome.dart';

class EditPage extends StatefulWidget {
  final List list;
  final int index;
  EditPage({this.list, this.index});
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController lastname = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController contactnumber = TextEditingController();

  bool editMode = false;

  addUpdateData() {
    if (editMode) {
      var url = 'http://192.168.254.121:8080/roomers_api/editpage.php';
      http.post(url, body: {
        'userid': widget.list[widget.index]['userid'],
        'lastname': lastname.text,
        'firstname': firstname.text,
        'email': email.text,
        'password': password.text,
        'contactnumber': contactnumber.text,
      });
    } else {
      var url = 'http://192.168.254.121:8080/roomers_api/editpage.php';
      http.post(url, body: {
        'lastname': lastname.text,
        'firstname': firstname.text,
        'email': email.text,
        'password': password.text,
        'contactnumber': contactnumber.text,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      lastname.text = widget.list[widget.index]['lastname'];
      firstname.text = widget.list[widget.index]['firstname'];
      email.text = widget.list[widget.index]['email'];
      password.text = widget.list[widget.index]['password'];
      contactnumber.text = widget.list[widget.index]['contactnumber'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editMode ? 'Update' : 'Add Data'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: lastname,
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: firstname,
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: contactnumber,
              decoration: InputDecoration(
                labelText: 'Phone number',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  addUpdateData();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashBoard(),
                  ),
                );
                debugPrint('Clicked RaisedButton Button');
              },
              color: Colors.blue,
              child: Text(
                editMode ? 'Update' : 'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
