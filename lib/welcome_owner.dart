import 'package:flutter/material.dart';

class WelcomeOwner extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Scaffold(appBar: AppBar(title: Text('Profile'))),
          Scaffold(
              appBar: AppBar(
                  backgroundColor: Color(0xFF00796B),
                  title: Text('Owned Rooms'))),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.white,
          child: TabBar(
            indicator: BoxDecoration(color: Colors.teal),
            tabs: <Widget>[
              Tab(
                  child:
                      Text("Profile", style: TextStyle(color: Colors.black))),
              Tab(child: Text("Rooms", style: TextStyle(color: Colors.black))),
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }
}
