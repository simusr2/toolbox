import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:toolbox/implementation/connectivity_plus.dart';
import 'package:toolbox/implementation/device_info_plus.dart';
import 'package:toolbox/widget/navigation_drawer_widget.dart';

class NetworkInfoPage extends StatefulWidget {
  const NetworkInfoPage({Key? key}) : super(key: key);

  @override
  State<NetworkInfoPage> createState() => _NetworkInfoPageState();
}

class _NetworkInfoPageState extends State<NetworkInfoPage> {
  String _connectionStatus = 'Unknown';
  StreamSubscription<ConnectivityResult>? _connectivityListener;

  @override
  initState() {
    super.initState();

    getDeviceInfoMap();

    getConnectionStatus().then((ConnectivityResult connectionStatus) {
      setState(() {
        _connectionStatus = getConnectionStatusString(connectionStatus);
      });
    });

    _connectivityListener = listenConnectivityChange((result) => {
          setState(() {
            _connectionStatus = getConnectionStatusString(result);
          })
        });
  }

  @override
  dispose() {
    super.dispose();
    if (_connectivityListener != null) {
      disposeConnectivityChangeListener(
          _connectivityListener as StreamSubscription<ConnectivityResult>);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Network info'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Network info'),
            Text('Connection status: $_connectionStatus'),
          ],
        ),
      ),
    );
  }
}
