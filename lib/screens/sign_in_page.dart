import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simonaapp/bloc/login_req/bloc.dart';
import 'package:simonaapp/screens/homepage.dart';
import 'package:simonaapp/screens/sign_up_page.dart';
import 'package:simonaapp/services/moor/moor.dart';

class SignInPage extends StatelessWidget {
//check user
  bool userexist = true;
//  bool userexist = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userexist? MyHomePage() : SignInPage()

    );
  }
}

class SignIn extends StatelessWidget {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Sign In Local ", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600
                  ),),
                  Divider(),
                  Material(
                    elevation: 3,
                    child: TextFormField(
                        onSaved: (value) => this.username = value,
                        decoration: InputDecoration(
                            labelText: "username",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            )
                        )
                    ),
                  ),
                  Divider(),
                  Material(
                    elevation: 3,
                    child: TextFormField(
                      onSaved: (val) => this.password = val,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "password",
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                  Divider(),
                  BlocListener<LoginReqBloc,LoginReqState>(
                    listener: (context,state){
                      if(state is UserLocalExistGoToLogin) print("user exists");
                    },

                    child: BlocBuilder<LoginReqBloc,LoginReqState>(
                      builder: (context,state) {
                        return FlatButton(
                          color: Colors.black,
                          child: Text("Login", style: TextStyle(
                              color: Colors.white
                          ),
                          ),
                          onPressed: () {
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}
