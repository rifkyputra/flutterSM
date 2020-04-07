import 'package:dio/dio.dart';
import 'package:simonaapp/constants/backendURL.dart';

class AttendanceService {
  final String url = Server().urlEmulator;
  getAll() async {
    Response<List> attendance;
    try {
      attendance = await Dio().get(url + '/attendance/all');
    } catch(e) {
      print(e);
    }
    return attendance.data;
  }

  getBysite() async {
    Response<List> attendance;
    try {
      attendance = await Dio().get(url + '/at')
    }catch(e) {
      print(e);
    }
  }
}