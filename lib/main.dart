import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simonaapp/bloc/login_req/bloc.dart';
import 'package:simonaapp/screens/login_google_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginReqBloc(),
          )
        ],
        child: MaterialApp(
          title: 'Material App',
          home: Scaffold(
            appBar: AppBar(
              title: Text('Material App Bar'),
            ),
            body: LoginPage(),

          ),
        ));
  }
}
