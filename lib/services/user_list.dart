import 'package:simonaapp/services/users.dart';


class UserList {
  List<Users> users = new List();

  UserList({
    this.users
  });

  factory UserList.fromJson(List<dynamic> parsedJson) {

    List<Users> users = new List<Users>();

    users = parsedJson.map((i) => Users.fromJson(i)).toList();

    return new UserList(
      users: users,
    );
  }
}