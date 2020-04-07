import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simonaapp/bloc/login_req/bloc.dart';
import 'package:simonaapp/screens/homepage.dart';
import 'package:simonaapp/screens/sign_up_page.dart';
import 'package:simonaapp/services/login_local_service.dart';
import 'package:simonaapp/services/moor/moor.dart';

class SignInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignIn()

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
                        validator: (val) {
                          if(val.isEmpty) {
                            return 'enter text!';
                          }
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(25)
                        ],
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
                      validator: (val) {
                        if(val.isEmpty) {
                          return 'enter text!';
                        }
                        return null;
                      },
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
                          color: Colors.indigo,
                          child: Text("Sign In", style: TextStyle(
                              color: Colors.white
                          ),
                          ),
                          onPressed: () {
                            if(_formKey.currentState.validate()) {
                            _formKey.currentState.save();
//                              print(this.username);
                              var val = LoginLocal()
                                  .userLogin(this.username.trim(), this.password);
                              val.then((v) {
                                if(v) {
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                    builder: (context) {
                                      return MyHomePage();
                                    }
                                  ),ModalRoute.withName('/'));
                                }
                              });

                            }
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have account ?"),
                        FlatButton(
                          child: Text('Sign up'),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return SignUpPage();
                                }
                            ));
                          },
                        )
                      ],
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
