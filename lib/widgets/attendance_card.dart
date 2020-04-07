import 'package:flutter/material.dart';
import 'package:simonaapp/models/attendance_model.dart';

class AttendanceCardWidget extends StatefulWidget {
  final AttendanceModel attendance;

  const AttendanceCardWidget({Key key, this.attendance}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AttendanceCardWidgetState();
}

class _AttendanceCardWidgetState extends State<AttendanceCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        dense: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Material(
            elevation: 10,
            shape: CircleBorder(),
            shadowColor: widget.attendance.color.withOpacity(0.4),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: widget.attendance.color,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Icon(
                  widget.attendance.icon,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              widget.attendance.name,
              style: TextStyle(
                  inherit: true, fontWeight: FontWeight.w700, fontSize: 16.0),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(widget.attendance.date,
                  style: TextStyle(
                      inherit: true, fontSize: 12.0, color: Colors.black45)),
              SizedBox(
                width: 20,
              ),
              Text(widget.attendance.hourIn, 
                  style: TextStyle(
                      inherit: true, fontSize: 12.0, color: Colors.black45)),
              Text(widget.attendance.hourOut,
                  style: TextStyle(
                      inherit: true, fontSize: 12.0, color: Colors.black45)),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}