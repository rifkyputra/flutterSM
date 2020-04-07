import 'package:flutter/material.dart';
import 'package:sized_context/sized_context.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.heightPct(1),
        width: context.widthPct(1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Simona", style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w600
            ),)
          ],
        ),
      ),
    );
  }
}
