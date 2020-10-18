import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Ofline, Connected }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connected;
  get serverStatus => this._serverStatus;
  IO.Socket _socket;
  get socket => this._socket;
  get emit => this._socket.emit;

  SocketService() {
    this.initConfig();
  }

  void initConfig() {
    this._socket = IO.io('http://192.168.0.25:3000', {
      'transports': ['websocket'],
      'autoConnect': true,
    });

    this._socket.on('connect', (_) {
      print('connect');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    this._socket.on('disconnect', (_) {
      this._serverStatus = ServerStatus.Ofline;
      notifyListeners();
    });

    this._socket.on('new-message', (payload) {
      print('New message $payload');
    });
  }
}
