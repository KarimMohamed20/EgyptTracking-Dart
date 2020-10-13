
import 'connectAndListen.dart';

void main(List<String> args) async {

  var connectAndListen = ConnectAndListen();
  await connectAndListen.studentConnection();
  await connectAndListen.driverConnection();

}



