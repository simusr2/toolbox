import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

String getConnectionStatusString(ConnectivityResult result) {
  switch (result) {
    case ConnectivityResult.mobile:
      return 'Mobile';
    case ConnectivityResult.ethernet:
      return 'Ethernet';
    case ConnectivityResult.bluetooth:
      return 'Bluetooth';
    case ConnectivityResult.wifi:
      return 'WiFi';
    case ConnectivityResult.none:
      return 'No Connection';
    default:
      return 'Unknown';
  }
}

Future<ConnectivityResult> getConnectionStatus() async {
  ConnectivityResult connectivityResult =
      await Connectivity().checkConnectivity();
  return connectivityResult;
}

StreamSubscription<ConnectivityResult> listenConnectivityChange(
    Function(ConnectivityResult) onConnectivityChange) {
  return Connectivity()
      .onConnectivityChanged
      .listen((ConnectivityResult result) {
    onConnectivityChange(result);
  });
}

void disposeConnectivityChangeListener(
    StreamSubscription<ConnectivityResult> subscription) {
  subscription.cancel();
}
