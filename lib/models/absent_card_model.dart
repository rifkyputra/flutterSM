class AbsentCardModel{
  final String _site, _manager, _absentEmployee;
  AbsentCardModel(
    this._site, this._manager, this._absentEmployee
  );

  String get site => _site;
  String get manager => _manager;
  String get absentEmployee => _absentEmployee;
}