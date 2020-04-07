import 'package:dio/dio.dart';
import 'package:simonaapp/constants/backendURL.dart';

class EmployeeRequest {
  getAll() async {
    var employee;
    try {
      employee = Dio().get(Server().urlEmulator+ '/employee/all').timeout(
        Duration(seconds: 5),
        onTimeout: () => Future.error("Timeout Request")
      );

    } catch(e) {
      print(e);
    }

    return employee;
  }
}