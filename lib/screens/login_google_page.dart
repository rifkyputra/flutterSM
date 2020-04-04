import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simonaapp/bloc/login_req/bloc.dart';
import 'package:simonaapp/screens/sign_up_page.dart';
import 'package:simonaapp/services/moor/moor.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocListener<LoginReqBloc, LoginReqState>(
                listener: (context, state) {
                  if(state is UserLoginFailed) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.msg),
                      )
                    );
                  } else if(state is ThrowToSignUpPage) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return SignUpPage();
                      }
                    ));
                  } else if(state is UserLoginSuccess){
                    Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Login Success"),
                        )
                    );
                  } else if(state is UserLocalExistGoToLogin) {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                      builder: (context) {
                        return Container(
                          child: Text("Login Page"),
                        );
                      }
                    ), ModalRoute.withName('/'));
                  }
                },
                child: BlocBuilder<LoginReqBloc, LoginReqState>(
                  builder: (context, state) {
                    return Column(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: ()async {
                            final res = User(
                              username: "rifkyadp1234",
                              password: "passwordssss"
                            );
//                            context.bloc<LoginReqBloc>().add(RegisterNewUser(res));
                            context.bloc<LoginReqBloc>().add(GetAllUsersEv());
                            print(res.password);
                          },
                          child: Text("get all"),
                        ),
                        FlatButton(
                          color: Colors.indigoAccent,
                          child: Text("Sign In with Google", style: TextStyle(
                              color: Colors.white
                          ),),
                          onPressed: () {
                            context.bloc<LoginReqBloc>().add(UserLogin("iiii"));
                          },
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
          SingleChildScrollView(
            child: Container(
              height: 160,
              child: BlocListener<LoginReqBloc, LoginReqState>(
                listener: (context, state){
                  if(state is GetAllUsersSuccess) print(state.allUsers);
                } ,
                child: BlocBuilder<LoginReqBloc, LoginReqState>(
                  builder: (context, state) {
                    return state is GetAllUsersSuccess ? ListView.builder(
                      itemCount: state.allUsers.length > 0? state.allUsers.length: 0,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(state.allUsers[index].username),
                            subtitle: Text(state.allUsers[index].password),
                          );
                        }
                    ) : Container();
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
