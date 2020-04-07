import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'package:simonaapp/constants/backendURL.dart';

class OnlineIndicatorService {

  String WEB_SOCKET_URL=Server().urlEmulator;

  SocketIO socket;
  Function statusCallback;
  OnlineIndicatorService(this.statusCallback);

  connect()async {
    socket = SocketIOManager().createSocketIO(WEB_SOCKET_URL, '/',socketStatusCallback: statusCallback);
//    socket = SocketIOManager().createSocketIO('http://192.168.43.131:4000', '/',socketStatusCallback: statusCallback);
    socket.destroy();
    socket.init();
    socket.connect();
  }

}