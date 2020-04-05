import 'package:flutter/material.dart';
import 'package:simonaapp/bloc/navbar/navbar_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './home_screen.dart';

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
       builder: (BuildContext context, NavbarStateScreen state) {
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
  }
}