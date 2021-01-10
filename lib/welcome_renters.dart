import 'package:flutter/material.dart';
import 'Renters_roomsgridview.dart';

class WelcomeRenter extends StatelessWidget {
  final List<Rooms> _allRooms = Rooms.allRooms();

  WelcomeRenter() {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xFF00796B),
          title: new Text(
            "Rooms to Rent",
            style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          leading: GestureDetector(
            onTap: () {/* Write listener code here */},
            child: Icon(
              Icons.menu,
              // add custom icons also
            ),
          ),
        ),
        body: new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: getHomePageBody(context)));
  }

  getHomePageBody(BuildContext context) {
    return ListView.builder(
      itemCount: _allRooms.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(0.0),
    );
  }

  // First Task
/* Widget _getItemUI(BuildContext context, int index) {
   return new Text(_allCities[index].name);
 }*/

  Widget _getItemUI(BuildContext context, int index) {
    return new Card(
        child: new Column(
      children: <Widget>[
        new ListTile(
          leading: new Image.asset(
            "assets/" + _allRooms[index].image,
            fit: BoxFit.cover,
            width: 100.0,
          ),
          title: new Text(
            _allRooms[index].price,
            style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          subtitle: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_allRooms[index].place,
                    style: new TextStyle(
                        fontSize: 13.0, fontWeight: FontWeight.normal)),
                new Text('Barangay: ${_allRooms[index].barangay}',
                    style: new TextStyle(
                        fontSize: 11.0, fontWeight: FontWeight.normal)),
              ]),
          onTap: () {
            _showSnackBar(context, _allRooms[index]);
          },
        )
      ],
    ));
  }

  _showSnackBar(BuildContext context, Rooms item) {
    final SnackBar objSnackbar = new SnackBar(
      content: new Text("${item.barangay} is located in ${item.place}"),
      backgroundColor: Colors.amber,
    );
    Scaffold.of(context).showSnackBar(objSnackbar);
  }
}
