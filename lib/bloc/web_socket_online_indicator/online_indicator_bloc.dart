import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:simonaapp/services/online_indicator_service.dart';
import './bloc.dart';

class OnlineIndicatorBloc extends Bloc<OnlineIndicatorEvent, OnlineIndicatorState> {

  OnlineIndicatorBloc() {
    socketStatus(status) {
      switch(status.toString()) {
        case "connect":
          this.add(OnlineEvent());
          break;
        default:
          this.add(OfflineEvent());
      }
    }
    OnlineIndicatorService(socketStatus)..connect();
  }

  @override
  OnlineIndicatorState get initialState => InitialOnlineIndicatorState();

  @override
  Stream<OnlineIndicatorState> mapEventToState(
    OnlineIndicatorEvent event,
  ) async* {
//    Completer ifCompletes = Completer();
//    final snapshots = event.connStream;
//    await for (final snapshot in snapshots) {
//      if(snapshot.toString() == "online") yield ConnectionOnline(snapshot);
//      else yield ConnectionOffline(snapshot);
//      print(snapshot);
//    }

    switch(event.runtimeType) {
      case OnlineEvent:
        yield ConnectionOnline("online");
        break;
      case OfflineEvent:
        yield ConnectionOffline("offline");
        break;
    }

  }
}
