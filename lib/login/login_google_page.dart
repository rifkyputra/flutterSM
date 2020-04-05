import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simonaapp/login/sign_in.dart';
import 'package:simonaapp/bloc/authentication/bloc.dart';
import 'package:simonaapp/login/login.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:simonaapp/login/login_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  final UserRepository _userRepository;

  LoginPage({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginWithCredentialsPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Login Failure'), Icon(Icons.error)],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Logging In...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final logo = Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Image.asset('assets/logo_smm.png', height: 200),
          );
          final email = TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
            autovalidate: true,
            autocorrect: false,
            validator: (_) {
              return !state.isEmailValid ? 'Invalid Email' : null;
            },
          );
          final password = TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: 'Password',
            ),
            obscureText: true,
            autovalidate: true,
            autocorrect: false,
            validator: (_) {
              return !state.isPasswordValid ? 'Invalid Password' : null;
            },
          );
          final loginButton = LoginButton(
            onPressed: isLoginButtonEnabled(state)
                ? _onFormSubmitted
                : null,
          );
          final signInGoogle = Material(
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: Colors.white,
              color: Colors.white70,
              elevation: 5.0,
              child: MaterialButton(
                minWidth: 200.0,
                height: 25.0,
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context).add(
                      LoginWithGooglePressed());
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
          );

          final signUp = FlatButton(
            child: Text(
              "Don’t Have an Account? Sign Up",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {},
          );
          return Scaffold(
            body:  Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.jpg'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(Colors.grey, BlendMode.darken),
                )),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 85.0, bottom: 10.0),
                children: <Widget>[
                  logo,
                  SizedBox(height: 48.0),
//                  email,
                  SizedBox(height: 8.0),
//                  password,
                  SizedBox(height: 24.0),
//                  loginButton,
                  SizedBox(height: 70.0),
                  signInGoogle,
                  SizedBox(height: 20.0),
                  signUp,
                ],
              ),
            ),
          );




        },
      ),
    );
  }


}
