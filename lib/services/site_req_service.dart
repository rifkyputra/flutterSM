import 'package:dio/dio.dart';
import 'package:simonaapp/constants/backendURL.dart';

class SiteService {
  String url = Server().urlEmulator;

  getAll() async {
    Response site;
    try {
      site = await Dio().get(url + '/site/all');
    }catch(e) {
      print(e);
    }
    return site.data;
  }

}