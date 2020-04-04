import 'dart:async';

import 'package:dio/dio.dart';


class LoginRequestService {
  final String url = 'http://localhost:5500/';



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