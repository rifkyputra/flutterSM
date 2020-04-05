import 'package:meta/meta.dart';

@immutable
abstract class OnlineIndicatorState {
  Object get condition => null;
}

class InitialOnlineIndicatorState extends OnlineIndicatorState {}


class ConnectionOnline extends OnlineIndicatorState {
  final String status;
  @override
  String get condition => status;

  ConnectionOnline(this.status);
}

class ConnectionOffline extends OnlineIndicatorState {
  final String status;
  @override
  String get condition=> status;

  ConnectionOffline(this.status);

  @override
  // TODO: implement props
  List<Object> get props => [this.status];
}