import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:moor/moor.dart';
import 'package:simonaapp/bloc/navbar/home_screen.dart';
import 'package:simonaapp/data/data.dart';
import 'package:simonaapp/models/absent_card_model.dart';
import 'package:simonaapp/screens/HomeScreen.dart';
import 'package:simonaapp/screens/history.dart';
import 'package:simonaapp/screens/homecontent.dart';
import 'package:simonaapp/screens/history.dart';
import 'package:simonaapp/screens/profile_list.dart';
import 'package:simonaapp/widgets/absent_card.dart';


part 'navbar_event.dart';
part 'navbar_state.dart';

enum NavbarItems {Homepage, History, Profile}

class NavbarBloc extends Bloc<NavbarItems, NavbarStateScreen> {
  @override
  NavbarStateScreen get initialState => Homepage();

  @override
  Stream<NavbarStateScreen> mapEventToState(
       NavbarItems event) async* {
    switch (event) {
      case NavbarItems.History:
        yield History();
        break;
      case NavbarItems.Profile:
        yield Profile();
        break;
      default:
        yield Homepage();
        break;
    }
  }
}

