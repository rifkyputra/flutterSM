import 'package:simonaapp/bloc/login_req/bloc.dart';
import 'package:simonaapp/services/moor/moor.dart';

class LoginLocal {
  UserDao db = UserDao(AppDB());

  LoginLocal._internal() {}
  static final singleton = LoginLocal._internal();
  factory LoginLocal() {
    return singleton;
  }

  Future userLogin(String username, String password) async {
    List user;
    try {
      user = await db.getByUsername(username);
//      if(user[0].password)
      if(user[0].password == password) return true;
      else return false;
      print(user[0].password );

    }catch(e) {
      print(e);
    }
    return false;
  }

  Future getAll() async {
    return await db.getAll();
  }
  Future searchUserExist()async {
    List user;
    try{
      user = await db.getAll();
      print(user);
      if(user.length <= 0 || user == null) return false;
    } catch(e) {
      return false;
      print(e);
    }
    return true;
  }
  Future newUser(User formData)async {
    int res;
    try {
      res = await db.postUser(formData);
      print("newusr");
      return res;
    }catch(e) {
      print(e);
    }
    return res;
//    yield(RegisterNewUserSuccess());
  }
}