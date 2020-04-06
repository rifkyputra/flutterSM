import 'package:flutter/material.dart';
import 'package:simonaapp/widgets/online_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simonaapp/bloc/login_req/bloc.dart';
import 'package:simonaapp/bloc/web_socket_online_indicator/bloc.dart';
import 'package:simonaapp/screens/sign_up_page.dart';
import 'package:simonaapp/services/moor/moor.dart';
import 'package:sized_context/sized_context.dart';
import 'package:simonaapp/screens/homepage.dart';
import 'package:simonaapp/widgets/sign_in.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: OnlineIndicator(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocListener<LoginReqBloc, LoginReqState>(
                listener: (context, state) {
                  if (state is UserLoginFailed) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(state.msg),
                    ));
                  } else if (state is ThrowToSignUpPage) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return SignUpPage();
                    }));
                  } else if (state is UserLoginSuccess) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Login Success"),
                    ));
                  } else if (state is UserLocalExistGoToLogin) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return Container(
                        child: Text("Login Page"),
                      );
                    }), ModalRoute.withName('/'));
                  }
                },
                child: BlocBuilder<LoginReqBloc, LoginReqState>(
                  builder: (context, state) {
                    return Column(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () async {
                            final res = User(
                                username: "rifkyadp1234",
                                password: "passwordssss");
//                            context.bloc<LoginReqBloc>().add(RegisterNewUser(res));
                            context.bloc<LoginReqBloc>().add(GetAllUsersEv());
                            print(res.password);
                          },
                          child: Text("get all"),
                        ),
                        FlatButton(
                          color: Colors.indigoAccent,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            context.bloc<LoginReqBloc>().add(UserLogin("iiii"));
                          },
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(30.0),
                          shadowColor: Colors.white,
                          color: Colors.white12,
                          elevation: 3.0,
                          child: MaterialButton(
                            minWidth: 200.0,
                            height: 25.0,
                            onPressed: () {
                              signInWithGoogle().then((value){
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) {
                                      return MyHomePage();
                                    }), ModalRoute.withName('/'));
                              });
                              },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                    image: AssetImage('assets/google_logo.png'),
                                    height: 35.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    'Sign in with Google',
                                    style: TextStyle(fontSize: 20, color: Colors.black54),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Container(
              height: 160,
              child: BlocListener<LoginReqBloc, LoginReqState>(
                listener: (context, state) {
                  if (state is GetAllUsersSuccess) print(state.allUsers);
                },
                child: BlocBuilder<LoginReqBloc, LoginReqState>(
                  builder: (context, state) {
                    return state is GetAllUsersSuccess
                        ? ListView.builder(
                            itemCount: state.allUsers.length > 0
                                ? state.allUsers.length
                                : 0,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(state.allUsers[index].username),
                                subtitle: Text(state.allUsers[index].password),
                              );
                            })
                        : Container();
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
