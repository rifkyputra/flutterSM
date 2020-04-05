import 'package:flutter/material.dart';
import 'package:simonaapp/bloc/navbar/navbar_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navbar/home_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarBloc, NavbarStateScreen>(
       builder: (BuildContext context, NavbarStateScreen state) {
         print(state.runtimeType);
         Widget render;
        if (state is Homepage)
          render = buildHomepage(state.title, Colors.blue, state.itemIndex);
        else if (state is Profile)
          render = buildHomepage(state.title, Colors.red, state.itemIndex);
        else
          render = Container(child: Text("Empty"),);
        return render;
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
          if (index==0) context.bloc<NavbarBloc>().add(NavbarItems.Homepage);
          if (index==1) context.bloc<NavbarBloc>().add(NavbarItems.Profile);
        },
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home), title: Text('Homepage')),
          BottomNavigationBarItem(icon:Icon(Icons.person), title: Text('Profile')),
        ],
      ),
    );
  }
}