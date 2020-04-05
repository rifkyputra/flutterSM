import 'package:bloc/bloc.dart';
import './home_screen.dart';

enum NavbarItems {Homepage, Profile}

class NavbarBloc extends Bloc<NavbarItems, NavbarState> {
  @override
  NavbarState get initialState => Homepage();

  @override
  Stream<NavbarState> mapEventToState(
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
