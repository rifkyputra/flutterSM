import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simonaapp/bloc/login_req/bloc.dart';
import 'package:simonaapp/bloc/web_socket_online_indicator/bloc.dart';
import 'package:simonaapp/screens/homepage.dart';
import 'package:simonaapp/screens/login_google_page.dart';
import 'package:simonaapp/screens/sign_in_page.dart';
import 'package:simonaapp/screens/sign_up_page.dart';
import './screens/homepage.dart';
import 'package:simonaapp/bloc/navbar/navbar_bloc.dart';
import 'package:simonaapp/screens/homepage.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//  check Connectivity
bool online = true;
//bool online = false;


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginReqBloc(),
          ),
          BlocProvider(
            create: (context) => OnlineIndicatorBloc(),
          ),
          BlocProvider(
            create: (context) => NavbarBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Material App',
          home: Scaffold(
            appBar: AppBar(
              title: Text('Simona'),
            ),
            body: online? LoginPage() : SignInPage()

          ),
        )
    );



  }
}