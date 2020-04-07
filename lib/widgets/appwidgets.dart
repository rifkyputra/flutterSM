import 'package:flutter/material.dart';
import 'package:simonaapp/models/app_model.dart';

class AppCardWidget extends StatelessWidget {
  final AppService service;
  const AppCardWidget({Key key, this.service})
      : assert(service != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100.0,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlue.shade50,
            blurRadius: 8.0,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(service.appIcon),
            radius: 25,
            backgroundColor: Color(0xfff1f3f5),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              service.name,
              style: TextStyle(
                  inherit: true,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                  color: Colors.grey),
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
