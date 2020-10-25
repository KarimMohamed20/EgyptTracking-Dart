import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'dart:async';

class ConnectAndListen {
  final _rideId = '5f85137f29d548798e6b3559';

  Future<void> studentConnection() async {
    var studentToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNWY4MjY5Njk0ODJkZTFjYzIzYmQ3ODNkIn0sImlhdCI6MTYwMjUyMzc1OCwiZXhwIjoxNjM0MDU5NzU4fQ.Rbh1cJjSZo4EcNFmj3u4WfT3iCQtzaxEhpOrA9VX4Mg';

    var socket = await IO.io('ws://localhost:3000/ride', <String, dynamic>{
      'path': '/socket.io',
      'transports': ['websocket', 'polling'],
      'autoConnect': true,
      'query': 'rideId=$_rideId&token=$studentToken'
    });

    socket.on('connect', (data) => print('Connected as a Student!'));

    socket.on(_rideId, (data) => print(data));
    socket.on(
      'disconnect',
      (_) => print('disconnect'),
    );
  }

  Future<void> driverConnection() async {
    var driverToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNWY4MjRhNjVhOWIzYTliNmVmZDdmYTNmIn0sImlhdCI6MTYwMjU1OTY1OCwiZXhwIjoxNjM0MDk1NjU4fQ.EY2od4e2dQgog0nJqmWxkQIObDRV2rrnXU4etWYTAiU';
    var socket = await IO.io('ws://localhost:3000/ride', <String, dynamic>{
      'path': '/socket.io',
      'transports': ['websocket', 'polling'],
      'autoConnect': true,
      'query': 'rideId=$_rideId&token=$driverToken'
    });

    socket.on('connect', (data) => print('Connected as a Driver!'));

    socket.emit('location', '{"lat":21.2020,"lng":21.2020}');

    socket.on(
      'disconnect',
      (_) => print('disconnect'),
    );
  }
}
