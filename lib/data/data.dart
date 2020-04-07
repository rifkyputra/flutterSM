import 'package:flutter/material.dart';
import 'package:simonaapp/models/absent_card_model.dart';
import 'package:simonaapp/models/app_model.dart';
import 'package:simonaapp/models/attendance_model.dart';

List<AbsentCardModel> getAbsentCard() {
  List<AbsentCardModel> absentCard = [];
  absentCard.add(AbsentCardModel(
    "BANJARMASIN",
    "MR. X",
    "08/50",
  ));
  return absentCard;
}

List<AppService> getAppService() {
  List<AppService> appCards = [
    AppService("QR Scan", ""),
    AppService("Claim Absent", ""),
    AppService("Ajukan Cuti", ""),
    AppService("Jadwal Shift", ""),
  ];
  return appCards;
}

List<AttendanceModel> getAttendanceCard() {
  List<AttendanceModel> attendanceCards = [
    AttendanceModel(Icons.turned_in, Color(0xFFffd60f), "Mr. X",
        "07-04-2020", "MASUK : 07.04", "KELUAR : 12.00"),
    AttendanceModel(Icons.turned_in, Color(0xFFff415f), "Mr. Y",
        "07-04-2020", "MASUK : 06.01", "KELUAR : 15.00"),
    AttendanceModel(Icons.turned_in, Color(0xFF50f3e2), "Mr. Z",
        "07-04-2020", "MASUK : 10.04", "KELUAR : 16.00"),
    AttendanceModel(Icons.turned_in, Colors.green, "Mr. A", "07-04-2020",
        "MASUK : 09.04", "KELUAR : 20.00"),
  ];

  return attendanceCards;
}