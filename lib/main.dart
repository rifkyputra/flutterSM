import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simonaapp/bloc/login_req/bloc.dart';
import 'package:simonaapp/bloc/web_socket_online_indicator/bloc.dart';
import 'package:simonaapp/screens/homepage.dart';
import 'package:simonaapp/screens/login_google_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './screens/homepage.dart';
import './bloc/navbar/navbar_bloc.dart';
=======
import 'package:simonaapp/screen/bloc.dart';
import 'package:simonaapp/screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
>>>>>>> 96d8cb895f405f8d7a404804f093c4a17daefbf7

void main() async {
  await DotEnv().load('.env');
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginReqBloc(),
          ),
          BlocProvider(
            create: (context) => OnlineIndicatorBloc(),
          ),
          BlocProvider(
            create: (context) => NavbarBloc()
          ),
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
=======
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NavbarBloc _navbarBloc;

  @override
  void initState() { 
    super.initState();
    _navbarBloc = NavbarBloc();
  }

  // @override
  // void dispose() {
  //   _navbarBloc.dispose();
  //   super.dispose();
  // }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
       bloc: _navbarBloc,
       builder: (BuildContext context, NavbarState state) {
         if (state is Homepage)
          return buildHomepage(state.title, Colors.blue, state.itemIndex);
        if (state is Profile)
          return buildHomepage(state.title, Colors.red, state.itemIndex);
       },
    );
  }

  Scaffold buildHomepage(String title, Color color, int currentIndex) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        color: color,
        child: Center(child: Text(title)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index==0) _navbarBloc.add(NavbarItems.Homepage);
          if (index==1) _navbarBloc.add(NavbarItems.Profile);
        },
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home), title: Text('Homepage')),
          BottomNavigationBarItem(icon:Icon(Icons.person), title: Text('Profile')),
        ],
      ),
    );
>>>>>>> 96d8cb895f405f8d7a404804f093c4a17daefbf7
  }
}
