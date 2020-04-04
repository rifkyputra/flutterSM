import 'package:meta/meta.dart';
import 'package:simonaapp/services/moor/moor.dart';

@immutable
abstract class LoginReqState {
  get allUsers => null;
  get msg => null;
}

class InitialLoginReqState extends LoginReqState {}


class UserLoginSuccess extends LoginReqState {

}

class GetAllUsersSuccess extends LoginReqState {
  final List _users;

  @override
  List<User> get allUsers => _users;

  GetAllUsersSuccess(this._users);

}

class UserLoginFailed extends LoginReqState {
  final String _msg;

  @override
  get msg => _msg;

  UserLoginFailed(this._msg);
}

class ThrowToSignUpPage extends LoginReqState {

}

class UserLocalExistGoToLogin extends LoginReqState {

}

class RegisterNewUserSuccess extends LoginReqState {

}