part of 'navbar_bloc.dart';

@immutable
abstract class NavbarStateScreen {
  get itemIndex => this.itemIndex;
  get title => this.title;
}

class Homepage extends NavbarStateScreen {
  //bisa diubah sesuai isi nanti gan
  final String title = "Homepage";
  final int itemIndex = 0;
}

class Profile extends NavbarStateScreen {
  final String title ="Profile";
  final int itemIndex = 1;
}