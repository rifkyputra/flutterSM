part of 'navbar_bloc.dart';

@immutable
abstract class NavbarStateScreen {
  get itemIndex => this.itemIndex;
  get title => this.title;
  get screen => this.screen;
  get history => this.history;
  get profile => this.profile;
}

class Homepage extends NavbarStateScreen {
  //bisa diubah sesuai isi nanti gan
  final String title ="Homepage";
  final int itemIndex = 0;
  final Widget screen = MyHomeContent();
}

class History extends NavbarStateScreen {
  final String title="History";
  final int itemIndex =1;
  final Widget history = MyHistory();
}

class Profile extends NavbarStateScreen {
  final String title ="Profile";
  final int itemIndex = 2;
  final Widget profile = ProfilePage();
}