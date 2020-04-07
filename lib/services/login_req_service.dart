import 'dart:async';

import 'package:dio/dio.dart';
import 'package:simonaapp/constants/backendURL.dart';


class LoginRequestService {
  final String url = Server().urlEmulator;



  Future login(data)async {
    var req;
    try{
      req = await Dio()
          .post(url + "login", data: {
            "username": "username",
            "password": "password"})
          .timeout(
            Duration(seconds: 6),
            onTimeout:() => Future.error("Login Timeout")
      );
      return req;
      print("err");

    } catch(e) {
      req = Exception(e);
//      req.complete("Timeout");
    }
    return req;
  }

}