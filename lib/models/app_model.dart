class AppService{
  String _appName,_appIcon;

  AppService(this._appName, this._appIcon);

  String get name => _appName;

  get appIcon => _appIcon;

}