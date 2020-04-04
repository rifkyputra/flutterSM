import 'package:meta/meta.dart';
import 'package:simonaapp/services/moor/moor.dart';

@immutable
abstract class LoginReqEvent {
  get formData => null;
  get data => null;
  get user => null;
}

class GetAllUsersEv extends LoginReqEvent {

}

class UserLogin extends LoginReqEvent {
  final _data;

  get data => _data;

  UserLogin(this._data);
}

class CheckUserInLocalDB extends LoginReqEvent {
  final String _user;

  get user => this._user;

  CheckUserInLocalDB(this._user);

}

class RegisterNewUser extends LoginReqEvent {
  final User _form;

  @override
  get formData => _form;

  RegisterNewUser(this._form);
}