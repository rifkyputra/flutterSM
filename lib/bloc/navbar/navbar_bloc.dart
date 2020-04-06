import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

enum NavbarItems {Homepage, Profile}

class NavbarBloc extends Bloc<NavbarItems, NavbarStateScreen> {
  @override
  NavbarStateScreen get initialState => Homepage();

  @override
  Stream<NavbarStateScreen> mapEventToState(
       NavbarItems event) async* {
    switch (event) {
      case NavbarItems.Profile:
        yield Profile();
        break;
      default:
        yield Homepage();
        break;
    }
  }
}

