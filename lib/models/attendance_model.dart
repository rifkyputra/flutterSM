import 'package:flutter/material.dart';

class AttendanceModel {
  IconData _icon;
  String _name, _date, _hourIn, _hourOut;
  Color _color;

  AttendanceModel(this._icon, this._color, this._name, this._date, this._hourIn, this._hourOut);

  String get name => _name;
  String get date => _date;
  String get hourIn => _hourIn;
  String get hourOut => _hourOut;
  IconData get icon => _icon;
  Color get color => _color;
}