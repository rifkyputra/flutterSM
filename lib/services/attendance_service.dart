import 'package:dio/dio.dart';
import 'package:simonaapp/constants/backendURL.dart';

class AttendanceService {
  final String url = Server().urlEmulator;
  getAll() async {
    Response<List> attendance;
    try {
      attendance = await Dio()
          .get(url + '/attendance/all')
          .timeout(
            Duration(seconds: 5),
            onTimeout: () => Future.error('timeout')
          );
    } catch(e) {
      print(e);
    }
    return attendance.data;
  }

  getBysite(siteName) async {
    Response<List> attendance;
    try {
      attendance = await Dio()
          .get(url + '/attendance?site=$siteName')
          .timeout(
            Duration(seconds: 5),
            onTimeout: () => Future.error("timeout")
          );
    }catch(e) {
      print(e);
    }
    return attendance.data;
  }

  getByDate(date) async {
    Response<List> attendance;
    try {
      attendance = await Dio()
          .get(url + '/attendance?date=$date')
          .timeout(
            Duration(seconds: 5),
            onTimeout: () => Future.error("timeout")
          );
    }catch(e) {
      print(e);
    }
    return attendance.data;
  }
  getByName(employeeName) async {
    Response<List> attendance;
    try {
      attendance = await Dio()
          .get(url + '/attendance?date=$employeeName')
          .timeout(
            Duration(seconds: 5),
            onTimeout: () => Future.error("timeout")
          );
    }catch(e) {
      print(e);
    }
    return attendance.data;
  }

  NewEntry() async {

  }
}