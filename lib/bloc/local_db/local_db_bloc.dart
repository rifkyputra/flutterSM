import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LocalDbBloc extends Bloc<LocalDbEvent, LocalDbState> {
  @override
  LocalDbState get initialState => InitialLocalDbState();

  @override
  Stream<LocalDbState> mapEventToState(
    LocalDbEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
