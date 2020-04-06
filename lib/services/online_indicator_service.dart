import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OnlineIndicatorService {
  String WEB_SOCKET_URL='http://192.168.1.102:5000';
//  String WEB_SOCKET_URL='http://10.0.2.2:5000';
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