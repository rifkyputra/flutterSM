import 'package:qrscan/qrscan.dart' as scanner;

Future<String> scan() async {
  String resultScan = await scanner.scan();
  }
