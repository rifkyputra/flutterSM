import 'package:flutter/material.dart';
import 'package:simonaapp/services/users.dart';
import 'package:simonaapp/services/user_list.dart';
import 'package:simonaapp/services/user_service.dart';
import './detail_profile.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {

  final TextEditingController _filter = new TextEditingController();

  UserList _records = new UserList();
  UserList _filteredRecords = new UserList();

  String _searchText = "";

  Icon _searchIcon = new Icon(Icons.search);

  Widget _appBarTitle = new Text("profile");

  @override
  void initState() {
    super.initState();

    _records.users = new List();
    _filteredRecords.users = new List();

    _getRecords();
  }

  void _getRecords() async {
    UserList records = await UserService().loadRecords();
    setState(() {
      for (Users record in records.users) {
        this._records.users.add(record);
        this._filteredRecords.users.add(record);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      backgroundColor: Color(0xFF4a8fff),
      body: _buildList(context),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      elevation: 0.1,
      backgroundColor: Color(0xFFc4c4c4),
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
            icon: _searchIcon,
            onPressed: _searchPressed
      )
    );
  }

  Widget _buildList(BuildContext context) {
    if (!(_searchText.isEmpty)) {
    _filteredRecords.users = new List();
      for (int i = 0; i < _records.users.length; i++) {
        if (_records.users[i].name.toLowerCase().contains(_searchText.toLowerCase())
            || _records.users[i].address.toLowerCase().contains(_searchText.toLowerCase())) {
          _filteredRecords.users.add(_records.users[i]);
        }
      }
    }

    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: this._filteredRecords.users.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Users users) {
    return Card(
      key: ValueKey(users.name),
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: ListTile(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Hero(
                  tag: "avatar_" + users.name,
                  child: CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(users.photo),
                  )
              )
          ),
          title: Text(
            users.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              new Flexible(
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: users.address,
                            style: TextStyle(color: Colors.white),
                          ),
                          maxLines: 3,
                          softWrap: true,
                        )
                      ]))
            ],
          ),
          trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => new DetailProfile(users: users)));
          },
        ),
      ),
    );
  }

  _HomePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          _resetRecords();
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  void _resetRecords() {
    this._filteredRecords.users= new List();
    for (Users record in _records.users) {
      this._filteredRecords.users.add(record);
    }
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          style: new TextStyle(color: Colors.white),
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search, color: Colors.white),
            fillColor: Colors.white,
            hintText: 'Search by name',
            hintStyle: TextStyle(color: Colors.white),
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text("Profile");
        _filter.clear();
      }
    });
  }
}