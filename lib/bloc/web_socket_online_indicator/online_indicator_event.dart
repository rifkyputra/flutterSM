import 'dart:async';

import 'package:meta/meta.dart';
import 'package:simonaapp/services/online_indicator_service.dart';

@immutable
abstract class OnlineIndicatorEvent {
  get connStream => null;
}


class ConnEvent extends OnlineIndicatorEvent {

  StreamController _connectionCtrl = StreamController.broadcast();

  Stream get connStream => _connectionCtrl.stream;

  socketStatus(status) {
    switch (status.toString()) {
      case "connect":
        _connectionCtrl.sink.add("online");
        break;
      default:
        _connectionCtrl.sink.add("offline");
    }
  }

  ConnEvent() {
    OnlineIndicatorService(socketStatus)
      ..connect();
  }

}

class OnlineEvent extends OnlineIndicatorEvent {

}

class OfflineEvent extends OnlineIndicatorEvent {

}