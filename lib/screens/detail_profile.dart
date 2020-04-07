import 'package:flutter/material.dart';
import 'package:simonaapp/services/users.dart';

class DetailProfile extends StatelessWidget {
  final Users users;
  DetailProfile({this.users});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(users.name),
        ),
        body: new ListView(
            children: <Widget>[
              Hero(
                tag: "avatar_" + users.name,
                child: new Image.network(
                    users.photo
                ),
              ),
              GestureDetector(
                  child: new Container(
                    padding: const EdgeInsets.all(32.0),
                    child: new Row(
                      children: [
                        new Expanded(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // NAMA.
                              new Container(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: new Text(
                                  "Name: " + users.name,
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // ALAMAT.
                              new Text(
                                "Address: " + users.address,
                                style: new TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // NO HP.
                        new Icon(
                          Icons.phone,
                          color: Colors.red[500],
                        ),
                        new Text(' ${users.contact}'),
                      ],
                    ),
                  )
              ),
            ]
        )
    );
  }
}