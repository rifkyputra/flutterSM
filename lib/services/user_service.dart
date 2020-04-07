import 'user_list.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class UserService {

  Future<String> _loadRecordsAsset() async {
    return await rootBundle.loadString('assets/user.json');
  }

  Future<UserList> loadRecords() async {
    String jsonString = await _loadRecordsAsset();
    final jsonResponse = json.decode(jsonString);
    UserList users = new UserList.fromJson(jsonResponse);
    return users;
  }

}
