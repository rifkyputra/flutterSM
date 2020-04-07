import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:simonaapp/services/login_local_service.dart';
import 'package:simonaapp/services/login_req_service.dart';
import 'package:simonaapp/services/moor/moor.dart';
import './bloc.dart';

class LoginReqBloc extends Bloc<LoginReqEvent, LoginReqState> {
  @override
  LoginReqState get initialState => InitialLoginReqState();

  @override
  Stream<LoginReqState> mapEventToState(
    LoginReqEvent event,
  ) async* {
    switch(event.runtimeType) {
      case UserLogin:
        var request;
        try {

          // try login to google
          request = await LoginRequestService().login(event.data);

          // throw exception when login timeout
          if (request is Exception) throw Exception("timeout");

          // return data when google login is success
          yield UserLoginSuccess();
        } catch(e) {
          // checking user in local db when google login is timeout
          if(e.toString() == "Exception: timeout") {
            print(e);
            // show snackbar
            yield UserLoginFailed("Device Offline");

            //add event sink to trigger checkuserinlocaldb
            this.add(CheckUserInLocalDB(event.user));
          }

          // TODO: return failed when unknown exception occurred
          yield UserLoginFailed("Uncatched Timeout");
        }

        break;

      case CheckUserInLocalDB:
        bool isExist = await LoginLocal().searchUserExist();
        print('is exsist : ' + isExist.toString());
        if(isExist) yield UserLocalExistGoToLogin();
        else yield ThrowToSignUpPage();
        break;

      case RegisterNewUser:
        int newusr;
        try {
          newusr = await LoginLocal().newUser(event.formData);
          if(newusr == null){
            yield RegisterNewUserFailed();
            break;
          }
        }catch(e) {
        }
        yield RegisterNewUserSuccess();
        break;
      case GetAllUsersEv:
        List<User> alluser;
        try {
          alluser = await LoginLocal().getAll();
          print("=========");
          print(alluser[0].username);
          yield(GetAllUsersSuccess(alluser));
        } catch(e) {
          print(e);
        }
        break;
    }
  }
}
