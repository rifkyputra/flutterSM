import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simonaapp/bloc/login_req/bloc.dart';
import 'package:simonaapp/services/moor/moor.dart';

class SignUpPage extends StatelessWidget {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Register New User ", style: TextStyle(
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
                      if(state is RegisterNewUserSuccess) print("new user registered");
                    },

                    child: BlocBuilder<LoginReqBloc,LoginReqState>(
                      builder: (context,state) {
                        return FlatButton(
                          color: Colors.black,
                          child: Text("Sign Up", style: TextStyle(
                              color: Colors.white
                          ),
                          ),
                          onPressed: () {
                            _formKey.currentState.save();
                            User user = User(
                              username: this.username,
                              password: this.password
                            );
                            context.bloc<LoginReqBloc>().add(RegisterNewUser(user));
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
      ),
    );
  }
}
