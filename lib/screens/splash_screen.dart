import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simonaapp/bloc/web_socket_online_indicator/bloc.dart';
import 'package:simonaapp/screens/login_google_page.dart';
import 'package:simonaapp/screens/sign_in_page.dart';
import 'package:simonaapp/screens/sign_up_page.dart';
import 'package:simonaapp/services/login_local_service.dart';
import 'package:simonaapp/services/login_req_service.dart';
import 'package:sized_context/sized_context.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OnlineIndicatorBloc, OnlineIndicatorState>(
        listener: (context,state){
          Future.delayed(Duration(seconds: 1), () {
            if(state is ConnectionOnline) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => LoginPage()
                  ),
                  ModalRoute.withName('/')
              );
            }
            if(state is ConnectionOffline) {
              var searchUser = LoginLocal().searchUserExist();
              searchUser.then((val) {
                print(val);

                if(val) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => SignInPage()
                      ),
                      ModalRoute.withName('/signin')
                  );
                } else {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => SignUpPage()
                      ),
                      ModalRoute.withName('/signup')
                  );
                }

              });

            }

          });
        },
        child: BlocBuilder<OnlineIndicatorBloc, OnlineIndicatorState>(
          builder: (context, state) {
            return Container(
              height: context.heightPct(1),
              width: context.widthPct(1),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.deepOrange, Colors.pinkAccent]
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Simona", style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600
                  ),),
                  SizedBox(
                    height: 40,
                  ),
                  CircularProgressIndicator()
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
